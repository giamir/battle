require 'forwardable'

class Game
  extend Forwardable

  def_delegator :attacker, :name, :attacker_name
  def_delegator :defender, :name, :defender_name
  def_delegator :defender, :dead?, :defender_dead?
  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player1, :hp_percentage, :player1_hp_percentage
  def_delegator :player2, :hp_percentage, :player2_hp_percentage
  def_delegator :player1, :critical_damage?, :player1_critical_damage?
  def_delegator :player2, :critical_damage?, :player2_critical_damage?

  attr_accessor :message

  def initialize(player1, player2)
    self.players = [player1, player2]
    self.current_turn = player1
  end

  def player1
    players.first
  end

  def player2
    players.last
  end

  def attacker
    current_turn
  end

  def defender
    players.find { |player| player != current_turn }
  end

  def switch
    self.current_turn = players.find { |player| player != current_turn }
  end

  private

  attr_accessor :current_turn, :players
end
