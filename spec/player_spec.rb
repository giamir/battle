require 'player'

describe Player do
  let(:player) { described_class.new('Jon', 'giamir.buoncristiani@gmail.com') }
  it 'returns its name' do
    expect(player.name).to eq 'Jon'
  end
  it 'returns its email' do
    expect(player.email).to eq 'giamir.buoncristiani@gmail.com'
  end
  it 'it has a starting HP' do
    expect(player.hp).to eq described_class::STARTING_HP
  end

  describe '#critical_damage?' do
    it 'is set to true if the player have less than a % HP' do
      amount = described_class::CRITICAL_PERC * described_class::STARTING_HP / 100
      player.receive_damage(described_class::STARTING_HP + 1 - amount)
      expect(player.critical_damage?).to be true
    end
  end

  describe '#receive_damage' do
    it 'deducts HP' do
      expect { player.receive_damage(10) }.to change { player.hp }.by(-10)
    end
  end

  describe '#dead?' do
    it 'is set to true if the player do not have any HP' do
      player.receive_damage(described_class::STARTING_HP)
      expect(player.dead?).to be true
    end
  end
end
