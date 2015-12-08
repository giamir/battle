feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Jon'
    fill_in :player_2_name, with: 'Giamir'
    click_button 'Submit'
    expect(page).to have_content 'Jon vs. Giamir'
  end
end
