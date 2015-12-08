require 'forwardable'

class Game
  extend Forwardable

  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player1, :hp, :player1_hp
  def_delegator :player2, :hp, :player2_hp

  attr_reader :players

  def initialize(player1, player2)
    @players = [player1, player2]
  end

  def player1
    players.first
  end

  def player2
    players.last
  end

  def attack(player)
    player.receive_damage
  end
end
