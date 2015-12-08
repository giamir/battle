require 'player'

describe Player do
  let(:player1) { described_class.new 'Jon' }
  it 'returns it/s name' do
    expect(player1.name).to eq 'Jon'
  end
  it 'it has a starting HP' do
    expect(player1.hp).to eq described_class::STARTING_HP
  end

  describe '#receive_damage' do
    it 'deducts HP' do
      expect { player1.receive_damage }.to change { player1.hp }.by(-2)
    end
  end
end
