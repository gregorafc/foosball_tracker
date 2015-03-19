class Match < ActiveRecord::Base
  belongs_to :home_player
  belongs_to :away_player
end
