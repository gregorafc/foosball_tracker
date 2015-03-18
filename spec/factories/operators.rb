FactoryGirl.define do
  factory :operator do
    login 'operator'
    password_digest BCrypt::Password.create('test1234', cost: 4) 
  end

end
