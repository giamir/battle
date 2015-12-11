def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Jon'
  fill_in :player_1_email, with: 'email1'
  fill_in :player_2_name, with: 'Giamir'
  fill_in :player_2_email, with: 'email2'
  click_button('Start a new game')
end
