feature 'Reduce HP' do
  scenario 'reduces defender by 10HP' do
    sign_in_and_play
    click_button('ATTACK')
    visit('play')
    expect(page).to have_content 'Giamir: 50HP'
  end
end
