feature 'first time user can register' do
  scenario 'user enters registration details and recieves confirmation' do
    visit '/registration'
    user_count = User.count
    fill_in 'username', with: 'email123@example.com'
    fill_in 'password', with: 'password123'
    click_button 'sign-up'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome email123@example.com'
    expect(User.count).to eq user_count + 1
  end
end
