require 'rails_helper'

feature 'User signs out' do
  scenario 'successfully' do
    user = create(:user, confirmed_at: Time.current, password: 'password')
    sign_in user
    visit root_path
    expect(page).to have_css 'h1', text: user.username
    expect(page).not_to have_css 'h1', text: 'Welcome to Shoutr'
    click_link user.username, id: 'navbarDropdown'
    click_link 'Sign out'
    visit root_path
    expect(page).to have_css 'h1', text: 'Welcome to Shoutr'
  end
end
