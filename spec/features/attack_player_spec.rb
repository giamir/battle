feature 'Attack player' do
  scenario 'click attack button and get a confirmation' do
    sign_in_and_play
    click_button('ATTACK')
    expect(page).to have_content 'Jon attacked Giamir'
  end
end
