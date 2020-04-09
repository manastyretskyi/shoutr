require 'rails_helper'

feature 'Guest tries to log in' do
  let(:user) { create(:user, confirmed_at: Time.current, password: 'password') }

  scenario 'successfully with username' do
    visit root_path
    click_link 'Log in'
    expect(page).to have_css 'h2', text: 'Log in'
    fill_in 'Email or username', with: user.username
    fill_in 'Password', with: 'password'
    click_on 'Log in', class: 'btn'
    expect(page).to have_css 'h1', text: user.username
    expect(page).not_to have_css 'h1', text: 'Welcome to Shoutr'
  end

  scenario 'successfully with email' do
    visit root_path
    click_link 'Log in'
    expect(page).to have_css 'h2', text: 'Log in'
    fill_in 'Email or username', with: user.email
    fill_in 'Password', with: 'password'
    click_on 'Log in', class: 'btn'
    expect(page).to have_css 'h1', text: user.username
    expect(page).not_to have_css 'h1', text: 'Welcome to Shoutr'
  end

  scenario 'unsuccessfully without password' do
    visit new_user_session_path
    expect(page).to have_css 'h2', text: 'Log in'
    fill_in 'Email or username', with: user.username
    fill_in 'Password', with: 'wrong_password'
    click_on 'Log in', class: 'btn'
    expect(page).to have_css 'h2', text: 'Log in'
    expect(page).to have_css 'div',
                             class: 'alert alert-danger',
                             text: 'Invalid Login or password.'
  end
end
