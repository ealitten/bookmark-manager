feature 'Add tags to bookmarks' do
  scenario 'User adds a new bookmark with one tag' do
    visit ('/links/new')
    fill_in 'title', with: 'google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: 'test-tag'
    click_button 'Submit'
    expect(current_path).to eq("/links")
    expect(page).to have_content("test-tag")
  end
end