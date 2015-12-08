require 'game'

describe Game do

  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:game) { described_class.new }

  describe '#attack' do
    it 'receive receive_damage' do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end
end
