require 'rails_helper'

feature 'Sign out' do
  scenario 'operator log out' do
    operator = FactoryGirl.create(:operator)
    signin('operator', 'test1234')
    expect(page).to have_content 'Log out'

    click_link 'Log out'
    expect(page).to have_content 'Logged out!'
  end

end