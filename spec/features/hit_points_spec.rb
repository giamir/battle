feature 'Hit points' do
  scenario 'seeing hit points' do
    sign_in_and_play
    expect(page).to have_css('div#attacker', text: "#{Player::STARTING_HP}HP")
  end

  scenario 'see opponents hit points' do
    sign_in_and_play
    expect(page).to have_css('div#defender', text: "#{Player::STARTING_HP}HP")
  end
end
