Player.delete_all
Operator.delete_all
Match.delete_all

Operator.create!( login: Rails.application.secrets.login,
                  password: Rails.application.secrets.password )

10.times do
  Player.create!(firstname: Faker::Name.first_name,
                lastname: Faker::Name.last_name,
                avatar: Faker::Avatar.image )
  puts 'Player'
end

Player.all.each do |home_player|
  Player.all.each do |away_player|
    unless home_player == away_player
      home_player_win = rand(2) == 1
      looser_score = rand(10)
      Match.create!( match_date: Faker::Date.backward(50),
                     home_player_win: home_player_win,
                     looser_score: looser_score,
                     home_player_id: home_player.id,
                     away_player_id: away_player.id )
      puts 'Match'
    end
  end
end
