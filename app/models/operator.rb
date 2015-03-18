class Operator < ActiveRecord::Base
  has_secure_password
  validates :login, :password_digest, presence: true
  validates :login, uniqueness: true

begin
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end


end
