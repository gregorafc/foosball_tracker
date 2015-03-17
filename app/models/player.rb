class Player < ActiveRecord::Base
  validates :firstname, :lastname, presence: true

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>'}
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..300.kilobytes }


end
