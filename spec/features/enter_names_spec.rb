feature 'Enter names and email' do
  scenario 'submitting name' do
    sign_in_and_play
    expect(page).to have_content 'Jon'
  end
  scenario 'submitting opponent name' do
    sign_in_and_play
    expect(page).to have_content 'Giamir'
  end
  context 'play vs computer' do
    scenario 'shows computer name' do
      sign_in_and_play_vs_computer
      expect(page).to have_content 'Computer'
    end
  end
end
