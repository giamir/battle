class Player
  attr_reader :name, :hp

  STARTING_HP = 60

  def initialize(name)
    self.name = name
    self.hp = STARTING_HP
  end

  def receive_damage
    self.hp -= 10
  end

  def no_hp?
    hp <= 0
  end

  private

  attr_writer :name, :hp
end
