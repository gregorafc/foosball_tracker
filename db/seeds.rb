Player.delete_all

10.times do
  Player.create(firstname: Faker::Name.first_name,
                lastname: Faker::Name.last_name,
                avatar: Faker::Avatar.image )
end
