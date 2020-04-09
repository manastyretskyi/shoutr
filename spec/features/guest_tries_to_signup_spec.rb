require 'rails_helper'

feature 'Guest tries to signup' do
  scenario 'successfully' do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_css 'h2', text: 'Sign up'
    fill_in 'Username', with: 'foo1'
    fill_in 'Email', with: 'example1@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'
    expect(page).to have_css 'h1', text: 'Welcome to Shoutr'
    expect(page).to have_css 'div', class: 'alert alert-success'
  end

  scenario 'unsuccessfully' do
    visit new_user_registration_path
    expect(page).to have_css 'h2', text: 'Sign up'
    fill_in 'Username', with: 'foo2'
    fill_in 'Email', with: 'example2@example.com'
    click_on 'Sign up'
    expect(page).to have_css 'h2', text: 'Sign up'
    expect(page).to have_css 'div', id: 'error_explanation'
    expect(page)
      .to have_css 'h4', text: '1 error prohibited this user from being saved:'
  end
end
