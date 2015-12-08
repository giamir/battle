feature 'Attack player' do
  scenario 'click attack button and get a confirmation' do
    sign_in_and_play
    click_button('ATTACK')
    expect(page).to have_content 'Jon attacked Giamir'
  end

  scenario 'second player to attack the first player' do
    sign_in_and_play
    click_button('ATTACK')
    click_link('Play')
    click_button('SWITCH')
    click_link('Play')
    click_button('ATTACK')
    expect(page).to have_content 'Giamir attacked Jon'

  end
end
