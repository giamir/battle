require 'forwardable'
require_relative './attack'

class Game
  extend Forwardable

  def_delegator :attacker, :name, :attacker_name
  def_delegator :defender, :name, :defender_name
  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player1, :hp_percentage, :player1_hp_percentage
  def_delegator :player2, :hp_percentage, :player2_hp_percentage
  def_delegator :player1, :critical_damage?, :player1_critical_damage?
  def_delegator :player2, :critical_damage?, :player2_critical_damage?

  attr_accessor :message
  attr_reader :attack_klass, :winner

  def initialize(player1, player2, attack_klass = Attack)
    self.players = [player1, player2]
    self.current_turn = player1
    self.attack_klass = attack_klass
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
    attack_and_switch if attacker.is_computer?
  end

  def winner
    return player2 if player1.dead?
    return player1 if player2.dead?
  end

  private

  attr_accessor :current_turn, :players
  attr_writer :attack_klass

  def attack_and_switch
    message << '<br>' << attack_klass.run(defender, 'random_attack')
    switch
  end
end
