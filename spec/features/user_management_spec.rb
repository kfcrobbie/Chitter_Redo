require 'spec_helper'

feature 'User Sign Up' do 
  scenario 'A user is greeted by a sign in page' do 
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to_have_content("Username:")
  end 
end 

