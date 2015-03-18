require 'rails_helper'

feature 'Visit players page' do

  describe 'normal visitor' do
    before :each do
       10.times do
        FactoryGirl.create(:player)
       end
       visit players_path
    end

    scenario 'visit players page' do
      expect(page).to have_content 'Players list'
    end

    scenario 'visit single player page' do
      click_link 'Show', match: :first
      expect(page).to have_selector('p', text: Player.first.firstname)
    end

    scenario 'try to edit player' do
      click_link 'Edit', match: :first
      expect(page).to have_content 'No authorization'
    end

    scenario 'try to delete player' do
      click_link 'Delete', match: :first
      expect(page).to have_content 'No authorization'
    end
  end

  describe 'operator visitor' do
    before :each do
      10.times do
       FactoryGirl.create(:player)
      end
      operator = FactoryGirl.create(:operator)
      signin('operator', 'test1234')
    end
    
    scenario 'players page' do
      expect(page).to have_content 'Logged in as'
    end

    scenario 'edit player' do
      click_link 'Edit', match: :first
      expect(page).to have_content 'Update player'

      fill_in 'Firstname', with: 'John'
      fill_in 'Lastname', with: 'Doe'
      attach_file('Avatar', File.join(Rails.root, '/spec/support/upload/ava.png'))
      click_button 'Update Player'
      expect(page).to have_content 'Player was succesfully updated.'
    end

    scenario 'add new player' do
      click_link 'New player'
      expect(page).to have_content 'New player'

      fill_in 'Firstname', with: 'John'
      fill_in 'Lastname', with: 'Doe'
      attach_file('Avatar', File.join(Rails.root, '/spec/support/upload/ava.png'))
      click_button 'Create Player'
      expect(page).to have_content 'Player was succesfully created.'
    end

    scenario 'delete player' do
      click_link 'Delete', match: :first
      expect(page).to have_content 'Player was succesfully deleted.'
    end

  end
end