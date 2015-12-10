class Player
  attr_reader :name, :hp

  STARTING_HP = 60

  def initialize(name)
    self.name = name
    self.hp = STARTING_HP
  end

  def receive_damage
    deduct_random_amount
  end

  def no_hp?
    hp <= 0
  end

  private

  def deduct_random_amount
    random_amount = (Kernel.rand(3) + 1) * 5
    self.hp -= random_amount
    random_amount
  end
  attr_writer :name, :hp
end
