require 'game'

describe Game do
  let(:attacker) { double :attacker, is_computer?: false }
  let(:defender) { double :defender, is_computer?: false }
  let(:attack_klass) { double :attack_klass }
  let(:game) { described_class.new(attacker, defender, attack_klass) }

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
    context 'if the game is vs computer' do
      before do
        allow(defender).to receive(:is_computer?).and_return(true)
        game.message = String.new
      end
      it 'attacks in behave of the computer' do
        expect(game.attack_klass).to receive(:run).and_return ''
        game.switch
      end
      it 'does not switch the attacker' do
        allow(game.attack_klass).to receive(:run)
        expect(game.attacker).to eq attacker
      end
    end
  end
end
