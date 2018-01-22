feature 'Homepage' do
  scenario 'User can see list of links on homepage' do
    expect(page).to have_link("My test bookmark")
  end
end