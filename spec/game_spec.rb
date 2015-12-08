require 'game'

describe Game do
  let(:attacker) { double :attacker }
  let(:defender) { double :defender }
  let(:game) { described_class.new(attacker, defender) }

  it 'retrieves the first player' do
    expect(game.attacker).to eq attacker
  end
  it 'retrieves the second player' do
    expect(game.defender).to eq defender
  end

  describe '#attack' do
    it 'receive receive_damage' do
      allow(defender).to receive(:no_hp?).and_return false
      expect(defender).to receive(:receive_damage)
      game.attack(game.defender)
    end
    context 'when player do not have any HP' do
      it 'set the loser' do
        allow(defender).to receive(:no_hp?).and_return true
        allow(defender).to receive(:receive_damage)
        game.attack(defender)
        expect(game.loser).to eq defender
      end
    end
  end
  describe '#switch' do
    it ' should reverse the order of players array' do
      game.switch
      expect(game.players).to eq [defender, attacker]
    end
  end
end
