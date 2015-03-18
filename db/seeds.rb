Player.delete_all
Operator.delete_all

Operator.create!( login: Rails.application.secrets.login,
                  password: Rails.application.secrets.password )


10.times do
  Player.create!(firstname: Faker::Name.first_name,
                lastname: Faker::Name.last_name,
                avatar: Faker::Avatar.image )
end
