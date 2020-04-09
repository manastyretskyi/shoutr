require 'rails_helper'

feature 'User visits homepage' do
  scenario 'unauthorized' do
    visit root_path
    expect(page).to have_css 'h1', text: 'Welcome to Shoutr'
    expect(page).to have_css 'a', text: 'Sign Up'
  end

  scenario 'authorized' do
    user = create(:user, confirmed_at: Time.current, password: 'password')
    sign_in user
    visit root_path
    expect(page).to have_css 'h1', text: user.username
    expect(page).not_to have_css 'h1', text: 'Welcome to Shoutr'
  end
end
