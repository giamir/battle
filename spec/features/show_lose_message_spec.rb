feature 'Show lose message' do
  scenario 'when a player do not have any HP' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(Player::STARTING_HP)
    click_button('ATTACK')
    expect(page).to have_content 'Jon win'
  end
end
