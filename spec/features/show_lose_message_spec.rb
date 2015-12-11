feature 'Show lose message' do
  scenario 'when a player do not have any HP' do
    sign_in_and_play
    deduct = (Player::STARTING_HP / 5) - 1
    allow(Kernel).to receive(:rand).and_return(deduct)
    click_button('ATTACK')
    expect(page).to have_content 'Jon win'
  end
end
