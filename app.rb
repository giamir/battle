require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  use Rack::MethodOverride
  def self.game=(game)
    @game = game
  end
  def self.game
    @game
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name], params[:player_1_email])
    player2 = Player.new(params[:player_2_name], params[:player_2_email])
    self.class.game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = self.class.game
    erb :play
  end

  post '/attack' do
    @game = self.class.game
    @game.attack(@game.defender)
    redirect '/game_over' if @game.loser
    redirect '/play'
  end

  get '/game_over' do
    @game = self.class.game
    erb :game_over
  end

  # put '/switch' do
  #   @game = self.class.game
  #   @game.switch
  #   redirect '/play'
  # end
  helpers do
    def game
      @game ||= self.class.game
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
