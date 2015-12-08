feature 'Reduce HP' do
  scenario 'reduces player 2 by 2HP' do
    sign_in_and_play
    click_button('ATTACK')
    visit('play')
    expect(page).to have_content 'Giamir: 98HP'
  end
end
