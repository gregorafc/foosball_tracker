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

  scope :rating_table, -> { Player.order(rating: :desc) }
  scope :active, -> { Player.where('retire = ?', false) }

  def fullname
    "#{firstname} #{lastname}"
  end

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
    if goals_by_win && goals_by_lose
      goals_by_win + goals_by_lose
    else
      goals_by_win || goals_by_lose
    end
  end

  def goals_lost_by_win 
    wins.map(&:looser_score).inject(:+)
  end

  def goals_lost_by_lose
    loses.count*10
  end

  def goals_lost
    if goals_lost_by_win && goals_lost_by_lose
      goals_lost_by_win + goals_lost_by_lose
    else
      goals_lost_by_win || goals_lost_by_lose
    end
  end

  def goals_per_game
    (goals / matches.count.to_f).round(2)
  end

  def goals_lost_per_game
    (goals_lost / matches.count.to_f).round(2)
  end

  def points
    wins.count * 3
  end

  def rate(opponent_rating, avg)
      self.rating = (points*0.7 + goals*0.05 - goals_lost*0.05 - matches.count*0.05 + opponent_rating*0.05 + avg*0.1).round(2)
      self.save
  end

  def avg_opp_rating
    if self.matches != [] 
      tab = home_matches.map(&:away_player_id) + away_matches.map(&:home_player_id)
      tab = tab.uniq
      (tab.map { |player| Player.find(player).rating }.inject(:+) / tab.size).round(2)
    end
  end

end