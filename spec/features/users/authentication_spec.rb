require "spec_helper"
require "rails_helper"

feature 'user can sign in' do
  scenario 'when filling the form correctly' do
    user = create(:user, email: 'nelly@email.com', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: 'nelly@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end
end

feature 'user can not sign in' do
  scenario 'when not filling the form correctly' do
    user = create(:user, email: 'nelly@email.com', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: 'nelly@email.com'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Log in'

    expect(current_path).to eq(new_user_session_path)
  end
end
