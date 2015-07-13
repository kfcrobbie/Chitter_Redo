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
    click 'sign_in'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, robathan")
  end

end
