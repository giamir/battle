class Player
  attr_reader :name, :hp

  STARTING_HP = 100

  def initialize(name)
    self.name = name
    self.hp = STARTING_HP
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    self.hp -= 2
  end

  private

  attr_writer :name, :hp
end
