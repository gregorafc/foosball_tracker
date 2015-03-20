class Player < ActiveRecord::Base
  has_many :home_matches, foreign_key: :home_player_id, class_name: 'Match'
  has_many :away_matches, foreign_key: :away_player_id, class_name: 'Match'

  validates :firstname, :lastname, presence: true

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>'}
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..300.kilobytes }


  has_many :home_wins, -> { where('home_player_win = ?', true) }, foreign_key: :home_player_id, class_name: 'Match'
  has_many :home_loses, -> { where('home_player_win = ?', false) }, foreign_key: :home_player_id, class_name: 'Match'
  has_many :away_wins, -> { where('home_player_win = ?', false) }, foreign_key: :away_player_id, class_name: 'Match'
  has_many :away_loses, -> { where('home_player_win =?', true) }, foreign_key: :away_player_id, class_name: 'Match'

  def matches
    home_matches + away_matches
  end

  def wins
    home_wins + away_wins
  end

  def loses
    home_loses + away_loses
  end

  def goals_by_win
    wins.count * 10
  end

  def goals_by_lose
    loses.map(&:looser_score).inject(:+)
  end

  def goals
    goals_by_win + goals_by_lose
  end

  def points
    wins.count * 3
  end

  def rating
    unless matches == []
      (points*0.7 + goals*0.2 - matches.count*0.1 ).round(2)
    end
  end

  def avg_opp_rating
    tab = home_matches.map(&:away_player_id) + away_matches.map(&:home_player_id)
    tab.map { |player| Player.find(player).rating }.inject(:+) / tab.size
  end

end