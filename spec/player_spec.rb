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

  describe '#receive_damage' do
    it 'deducts HP' do
      allow(Kernel).to receive(:rand).and_return(0)
      expect { player.receive_damage }.to change { player.hp }.by(-5)
    end
  end

  describe '#no_hp?' do
    it 'is set to true if the player do not have any HP' do
      deduct = (described_class::STARTING_HP / 5) - 1
      allow(Kernel).to receive(:rand).and_return(deduct)
      player.receive_damage
      expect(player.no_hp?).to be true
    end
  end
end
