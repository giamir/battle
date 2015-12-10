require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  use Rack::MethodOverride
  def Battle.game=(game)
    @game = game
  end
  def Battle.game
    @game
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    self.class.game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = self.class.game
    erb :play
  end

  put '/attack' do
    @game = self.class.game
    @game.attack(@game.defender)
    redirect '/game_over' if @game.loser
    redirect '/play'
  end

  get '/game_over' do
    @game = self.class.game
    erb :game_over
  end

  put '/switch' do
    @game = self.class.game
    @game.switch
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
