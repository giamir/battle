require 'digest'

class Player
  attr_reader :name, :hp, :email

  STARTING_HP = 60
  CRITICAL_PERC = 30

  def initialize(name, email)
    self.name = name
    self.email = email
    self.hp = STARTING_HP
  end

  def critical_damage?
    hp_percentage < CRITICAL_PERC
  end

  def receive_damage(amount)
    self.hp -= amount
    amount
  end

  def img_link
    'http://www.gravatar.com/avatar/' << calculate_md5.to_s
  end

  def dead?
    hp <= 0
  end

  private

  attr_writer :name, :hp, :email

  def hp_percentage
    hp * 100 / STARTING_HP
  end

  def calculate_md5
    md5 = Digest::MD5.new
    md5 << email.downcase
  end
end
