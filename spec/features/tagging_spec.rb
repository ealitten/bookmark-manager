feature 'Add tags to bookmarks' do
  scenario 'User adds a new bookmark with one tag' do
    visit ('/links/new')
    fill_in 'title', with: 'google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: 'test-tag'
    click_button 'Submit'
    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include('test-tag')
  end
end