feature 'Show lose message' do
  scenario 'when a player do not have any HP' do
    sign_in_and_play
    5.times do
      click_button('ATTACK')
      click_link('Play')
    end
    click_button('ATTACK')
    expect(page).to have_content 'Giamir, you lose!'
  end
end
