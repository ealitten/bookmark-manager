feature 'View bookmark list' do
  scenario 'User can see list of bookmarks on homepage' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "My test bookmark")
    visit ('/links')
    expect(page).to have_content("My test bookmark")
  end

  scenario 'User can filter bookmarks by tags' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "My test bookmark", tags: [Tag.first_or_create(name: 'ruby')])
    Bookmark.create(url: "http://www.google.com", title: "My bubbling bookmark", tags: [Tag.first_or_create(name: 'bubbles')])
    visit ('/tags/bubbles')
    expect(page).to have_content("My bubbling bookmark")
    expect(page).not_to have_content("My test bookmark")
  end
end
