class Attack
  ATTACKS = [
    'basic'
  ]

  def initialize(player)
    self.player = player
  end

  def self.run(player, type)
    fail "#{type} attack is no available" unless ATTACKS.include?(type)
    new(player).send(type.to_sym)
  end

  def basic
    player.receive_damage(random_damage_amount)
    "#{player.name} received #{random_damage_amount}HP damage"
  end

  private

  attr_accessor :player, :type

  def random_damage_amount
    Kernel.rand(1..15)
  end
end
