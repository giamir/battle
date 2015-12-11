require 'forwardable'

class Game
  extend Forwardable

  def_delegator :attacker, :name, :attacker_name
  def_delegator :defender, :name, :defender_name
  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player1, :hp, :player1_hp
  def_delegator :player2, :hp, :player2_hp
  def_delegator :player1, :hp_percentage, :player1_hp_percentage
  def_delegator :player2, :hp_percentage, :player2_hp_percentage
  def_delegator :player1, :critical_damage?, :player1_critical_damage?
  def_delegator :player2, :critical_damage?, :player2_critical_damage?

  attr_reader :players, :loser, :deducted_point

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

  def attack(player)
    self.deducted_point = player.receive_damage
    return loser if end_of_game(player)
    switch
  end

  private

  attr_accessor :current_turn
  attr_writer :players, :deducted_point, :loser

  def end_of_game(player)
    self.loser = player if player.no_hp?
  end
end
