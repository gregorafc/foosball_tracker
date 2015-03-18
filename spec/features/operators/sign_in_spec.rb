require 'rails_helper'

feature 'Sign in' do
  scenario 'operator cannot sign in if not registered' do
    visit '/sessions/new'
    fill_in 'login', with: 'operator'
    fill_in 'password', with: 'test1234'
    click_button 'Sign in'
    expect(page).to have_content 'Login or password invalid!'
  end

  scenario 'operator sign in' do
    operator = FactoryGirl.create(:operator)
    
    visit '/sessions/new'
    fill_in 'login', with: operator.login
    fill_in 'password', with: operator.password_digest
    click_button 'Sign in'
    expect(page).to have_content 'Logged in!'
  end
end