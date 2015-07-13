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
    sign_up
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, Jonabert")
  end

  scenario 'A user cannot sign up with an already registered username' do
    visit '/'
    click_button "Sign Up"
    sign_up
    visit '/'
    click_button "Sign Up"
    sign_up
    expect(page).to have_content("Username already registered")
  end

  scenario 'A user cannot sign up with an already registered email' do
    visit '/'
    click_button "Sign Up"
    sign_up
    visit '/'
    click_button "Sign Up"
    sign_up
    expect(page).to have_content("Email already registered")
  end

  scenario 'Requires a matching password confirmation' do
    visit '/'
    click_button "Sign Up"
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end 

  # scenario 'A non-user cannot sign in' do
  #   visit '/'
  #    fill_in :username, with: 'jonabert'
  #   fill_in :password, with: 'test'
  #   click_button 'Sign in'
  #   expect(page).to have_content("Unknown username or incorrect password")
  # end

end

def sign_up(name: 'Robathan Sagan',
            email: 'jonabert@example.com',
            username: 'Jonabert',
            password: 'oranges',
            password_confirmation: 'oranges')
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end
