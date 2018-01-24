feature 'View bookmarks with a specific tage' do
  scenario 'User visits /tags/bubbles and only sees BMs with that tag' do
    visit ('/links/new')
    fill_in 'title', with: 'bubbly bookmark'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: 'bubbles'
    click_button 'Submit'
    visit ('/tags/bubbles')
    expect(page).to have_content('bubbles')
  end
end