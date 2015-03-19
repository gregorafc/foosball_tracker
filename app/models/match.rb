class Match < ActiveRecord::Base
  belongs_to :home_player
  belongs_to :away_player

  validates :home_player_id,
            :away_player_id,
            :looser_score,
            :match_date, presence: true
  validates :looser_score, inclusion: { in: 0..9 }
  validates :home_player_win, inclusion: [ true, false ]
end
