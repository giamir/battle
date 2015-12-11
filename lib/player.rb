require 'digest'

class Player
  attr_reader :name, :hp, :email

  STARTING_HP = 60

  def initialize(name, email)
    self.name = name
    self.email = email
    self.hp = STARTING_HP
  end

  def hp_percentage
    hp * 100 / STARTING_HP
  end

  def critical_damage?
    hp_percentage < 30
  end

  def receive_damage
    deduct_random_amount
  end

  def img_link
    'http://www.gravatar.com/avatar/' << calculate_md5.to_s
  end

  def no_hp?
    hp <= 0
  end

  private

  attr_writer :name, :hp, :email

  def deduct_random_amount
    random_amount = (Kernel.rand(3) + 1) * 5
    self.hp -= random_amount
    random_amount
  end

  def calculate_md5
    md5 = Digest::MD5.new
    md5 << email.downcase
  end
end
