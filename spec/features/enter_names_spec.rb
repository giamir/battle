feature 'Enter names and email' do
  scenario 'submitting name' do
    sign_in_and_play
    expect(page).to have_content 'Jon'
  end
  scenario 'submitting opponent name' do
    sign_in_and_play
    expect(page).to have_content 'Giamir'
  end
end
