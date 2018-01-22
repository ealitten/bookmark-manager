feature 'Bookmark list' do
  scenario 'User can see list of links on homepage' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "My test bookmark")
    visit ('/links')
    expect(page).to have_content("My test bookmark")
  end
end