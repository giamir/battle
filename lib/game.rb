require 'forwardable'

class Game
  extend Forwardable

  def_delegator :attacker, :name, :attacker_name
  def_delegator :defender, :name, :defender_name
  def_delegator :attacker, :hp, :attacker_hp
  def_delegator :defender, :hp, :defender_hp

  attr_reader :players, :loser, :deducted_point

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
    @deducted_point = nil
    @players.reverse!
  end

  def attack(player)
    @deducted_point = player.receive_damage
    end_of_game(player)
  end

  private

  def end_of_game(player)
    @loser = player if player.no_hp?
  end
end
