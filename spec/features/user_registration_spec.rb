def fill_in_form
  visit '/users/new'
  fill_in 'username', with: 'email123@example.com'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password123'
  click_button 'sign-up'
end

def non_matching_passwords
  visit '/users/new'
  fill_in 'username', with: 'email234@example.com'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password789'
  click_button 'sign-up'
end

feature 'First-time user can register' do
  scenario 'User enters registration details and recieves confirmation' do
    expect{ fill_in_form }.to change { User.count }.by 1
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome email123@example.com'
  end
  scenario 'User enters non-matching passwords' do
    expect{ non_matching_passwords }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
