require 'forwardable'

class Game
  extend Forwardable

  def_delegator :attacker, :name, :attacker_name
  def_delegator :defender, :name, :defender_name
  def_delegator :attacker, :hp, :attacker_hp
  def_delegator :defender, :hp, :defender_hp

  attr_reader :players, :attacker

  def initialize(attacker, defender)
    @players = [attacker, defender]
  end

  def attacker
    players.first
  end

  def defender
    players.last
  end

  def switch
    @players.reverse!
  end

  def attack(player)
    player.receive_damage
  end
end
