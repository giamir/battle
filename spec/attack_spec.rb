require 'attack'

describe Attack do
  let(:klass) { described_class }
  let(:player) { double :player }
  describe '::run' do
    it 'raise an error if the attack type is not available' do
      msg = 'no_available attack is no available'
      expect { klass.run(player, 'no_available') }.to raise_error msg
    end
    context 'calls with basic type attack' do
      it 'damages the player' do
        allow(player).to receive(:name)
        expect(player).to receive(:receive_damage)
        klass.run(player, 'basic')
      end
    end
  end
end
