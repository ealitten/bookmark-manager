feature 'Homepage' do
  scenario 'User can see list of links on homepage' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "My test bookmark")
    visit ('/')
    expect(page).to have_link("My test bookmark")
  end
end