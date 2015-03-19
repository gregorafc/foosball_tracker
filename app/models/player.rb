class Player < ActiveRecord::Base
  has_many :home_matches, foreign_key: :home_player_id, class_name: 'Match'
  has_many :away_matches, foreign_key: :away_player_id, class_name: 'Match'

  validates :firstname, :lastname, presence: true

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>'}
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..300.kilobytes }


end
