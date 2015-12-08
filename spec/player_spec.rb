require 'player'

describe Player do
  it 'returns it/s name' do
    player = described_class.new "Jon"
    expect(player.name).to eq "Jon"
  end

end
