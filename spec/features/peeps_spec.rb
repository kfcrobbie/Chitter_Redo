require 'spec_helper'

feature 'Peeps' do

  scenario 'a user can post a peep' do
    visit '/'
    click_button "Sign Up"
    sign_up
    fill_in :New_Peep, with: "This is a test Peep"
    click_button 'Post Peep'
    expect(page).to have_content "This is a test Peep"
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
end
