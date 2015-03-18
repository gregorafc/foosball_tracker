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
    visit players_path
    end

  end
end