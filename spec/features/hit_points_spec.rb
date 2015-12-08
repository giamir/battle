feature 'Hit points' do
  scenario 'seeing hit points' do
    sign_in_and_play
    expect(page).to have_content 'Giamir: 100HP'
  end
end
