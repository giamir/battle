require 'game'

describe Game do
  let(:attacker) { double :attacker }
  let(:defender) { double :defender }
  let(:game) { described_class.new(attacker, defender) }

  it 'retrieves the attacker player' do
    expect(game.attacker).to eq attacker
  end
  it 'retrieves the defender player' do
    expect(game.defender).to eq defender
  end

  describe '#switch' do
    it ' should reverse the order of players array' do
      game.switch
      expect(game.attacker).to eq defender
    end
  end
end
