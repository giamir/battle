require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/computer_player'
require_relative './lib/game'
require_relative './lib/attack'

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
    if params[:vs_computer?]
      player2 = ComputerPlayer.new
    else
      player2 = Player.new(params[:player_2_name], params[:player_2_email])
    end
    self.class.game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    game
    erb :play
  end

  post '/attack' do
    game.message = Attack.run(game.defender, 'basic')
    game.switch
    redirect '/game_over' if game.winner
    redirect '/play'
  end

  get '/game_over' do
    game
    erb :game_over
  end

  helpers do
    def game
      @game ||= self.class.game
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
