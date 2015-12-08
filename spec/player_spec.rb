require 'player'

describe Player do
  let(:player1) { described_class.new 'Jon' }
  let(:player2) { described_class.new 'Giamir' }
  it 'returns it/s name' do
    expect(player1.name).to eq 'Jon'
  end
  it 'it has a starting HP' do
    expect(player1.hp).to eq described_class::STARTING_HP
  end

  describe '#attack' do
    it 'deducts HP' do
      expect { player1.attack(player2) }.to change { player2.hp }.by(-2)
    end
  end
end
