require 'game'

describe Game do

  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:game) { described_class.new(player1, player2) }

  it 'retrieves the first player' do
    expect(game.player1).to eq player1
  end
  it 'retrieves the second player' do
    expect(game.player2).to eq player2
  end

  describe '#attack' do
    it 'receive receive_damage' do
      expect(player2).to receive(:receive_damage)
      game.attack(game.player2)
    end
  end
end
