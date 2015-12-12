class Attack
  ATTACKS = [
    'basic',
    'random_attack'
  ]

  def initialize(player)
    self.player = player
  end

  def self.run(player, type)
    fail "#{type} attack is no available" unless ATTACKS.include?(type)
    new(player).send(type.to_sym)
  end

  def basic
    amount = random_damage_amount
    player.receive_damage(amount)
    "#{player.name} received #{amount}HP damage"
  end

  def random_attack
    chosen = ATTACKS.select { |attack| attack != 'random_attack' }.sample
    send(chosen.to_sym)
  end

  private

  attr_accessor :player, :type

  def random_damage_amount
    Kernel.rand(1..15)
  end
end
