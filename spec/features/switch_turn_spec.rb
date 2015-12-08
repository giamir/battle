feature 'Switch turn' do
  scenario 'click switch button and get a confirmation' do
    sign_in_and_play
    click_button('SWITCH')
    expect(page).to have_content 'Giamir is now attacking'
  end
end
