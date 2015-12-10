feature 'Switch turn' do
  scenario 'switch the players' do
    sign_in_and_play
    click_button('SWITCH')
    expect(page).to have_css('div#attacker', text: 'Giamir')
  end
end
