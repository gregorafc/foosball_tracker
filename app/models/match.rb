class Match < ActiveRecord::Base
  belongs_to :home_player, class_name: 'Player'
  belongs_to :away_player, class_name: 'Player'

  validates :home_player_id,
            :away_player_id,
            :looser_score,
            :match_date, presence: true
  validates :looser_score, inclusion: { in: 0..9 }
  validate :home_away

  after_save :rate_update

  def rate_update
    home = self.home_player.rating
    away = self.away_player.rating

    self.home_player.rate(away)
    self.away_player.rate(home)
  end


 
  def home_away 
    if self.home_player_id == self.away_player_id
      errors.add( :base, 'Same player')
    end
  end

end
