feature 'Hit points' do
  scenario 'seeing hit points' do
    sign_in_and_play
    expect(find('#progress-bar-1')['style']).to eq 'width:100%'
  end

  scenario 'seeing opponent hit points' do
    sign_in_and_play
    expect(find('#progress-bar-2')['style']).to eq 'width:100%'
  end
end
