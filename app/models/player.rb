class Player < ActiveRecord::Base
  validates :firstname, :lastname, presence: true

end
