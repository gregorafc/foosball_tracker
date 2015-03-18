require 'rails_helper'

feature 'Sign in' do
  scenario 'operator cannot sign in if not registered' do
    signin('operator', 'test1234')
    expect(page).to have_content 'Login or password invalid!'
  end

  scenario 'operator sign in' do
    operator = FactoryGirl.create(:operator)
    signin('operator', 'test1234')
    expect(page).to have_content 'Logged in!'
  end
end