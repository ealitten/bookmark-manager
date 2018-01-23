  feature 'Add bookmark to list' do
    scenario 'User adds a bookmark via a form' do
      visit ('/links/new')
      fill_in 'title', with: 'google'
      fill_in 'url', with: 'www.google.com'
      click_button 'Submit'
      expect(current_path).to eq("/links")
      expect(page).to have_content("google")
      expect(page).to have_content("www.google.com")
    end
  end
