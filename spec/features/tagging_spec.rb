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

  scenario 'User adds a new bookmark with several tags' do
    visit ('/links/new')
    fill_in 'title', with: 'google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: 'test-tag, bubbles, ruby'
    click_button 'Submit'
    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include('test-tag')
    expect(bookmark.tags.map(&:name)).to include('bubbles')
    expect(bookmark.tags.map(&:name)).to include('ruby')
  end
end