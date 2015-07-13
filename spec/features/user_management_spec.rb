require 'spec_helper'

feature 'User Sign Up' do
  scenario 'A user is greeted by a welcome page' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Username:")
  end


  scenario 'A user can sign in' do
    User.create(username: 'robathan', password: 'test') #User.create create a user and saves it to database unlike User.new
    visit '/'
    fill_in :username, with: 'robathan'
    fill_in :password, with: 'test'
    click_button 'Sign in'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, robathan")
  end

  scenario 'A user can sign up ' do 
    visit '/' 
    click_button "Sign Up"
    fill_in :username, with: 'Jonabert'
    fill_in :email, with:'jonabert@example.com' 
    fill_in :password, with: 'oranges'
    fill_in :password_confirmation. with:'oranges'
    click_button 'Sign Up'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome to Chitter, Jonabert")
  end
  # scenario 'A non-user cannot sign in' do
  #   visit '/'
  #    fill_in :username, with: 'jonabert'
  #   fill_in :password, with: 'test'
  #   click_button 'Sign in'
  #   expect(page).to have_content("Unknown username or incorrect password")
  # end

end
