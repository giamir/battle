require 'player'

describe Player do
  let(:player) { described_class.new 'Jon' }
  it 'returns it/s name' do
    expect(player.name).to eq 'Jon'
  end
  it 'it has a starting HP' do
    expect(player.hp).to eq described_class::STARTING_HP
  end

  describe '#receive_damage' do
    it 'deducts HP' do
      expect { player.receive_damage }.to change { player.hp }.by( a_value >= (-20) && a_value <= (-5) )
    end
  end

  describe '#no_hp?' do
    it 'is set to true if the player do not have any HP' do
      12.times { player.receive_damage }
      expect(player.no_hp?).to be true
    end
  end
end
