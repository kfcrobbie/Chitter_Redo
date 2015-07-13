require 'spec_helper'

feature 'User Sign Up' do
  scenario 'A user is greeted by a welcome page' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Username:")
  end


  scenario 'A user can sign in' do
    visit '/'
    User.new(username: 'robathan', password: 'test')
    fill_in :username, with: 'robathan'
    fill_in :password, with: 'test'
    click 'sign_in'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, robathan")
  end

end
