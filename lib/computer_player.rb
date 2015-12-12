require_relative './player'

class ComputerPlayer < Player

  def initialize
    self.name = 'Computer'
    self.hp = STARTING_HP
    self.computer = true
  end

  def img_link
    'images/computer.jpg'
  end
end
