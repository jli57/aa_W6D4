require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content('SIGN UP')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup'

  end
end
