require 'rails_helper'

describe Match do
  context 'validations' do
    it { should validate_presence_of :match_date }
    it { should validate_presence_of :looser_score }
    it { should validate_presence_of :home_player_id }
    it { should validate_presence_of :away_player_id }
    it { should validate_inclusion_of(:looser_score).in_range(0..9) }

    it 'cant save with same player' do
      p = FactoryGirl.create(:player)
      m = FactoryGirl.build(:match, home_player_id: p.id, away_player_id: p.id)
      m.valid?
      expect(m.errors.size).to eq 1
      expect(m.errors[:base]).to eq ['Same player']
    end
  end

  context 'relations' do
    it { should belong_to(:home_player).class_name('Player') }
    it { should belong_to(:away_player).class_name('Player') }
  end

end
