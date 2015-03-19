require 'rails_helper'

describe Match do
  context 'validations' do
    it { should validate_presence_of :match_date }
    it { should validate_presence_of :looser_score }
    it { should validate_presence_of :home_player_id }
    it { should validate_presence_of :away_player_id }
    it { should validate_inclusion_of(:looser_score).in_range(0..9) }
  end

  context 'relations' do
    it { should belong_to(:home_player).class_name('Player') }
    it { should belong_to(:away_player).class_name('Player') }
  end

end
