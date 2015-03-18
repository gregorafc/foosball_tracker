FactoryGirl.define do

  factory :player do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
  end

end
