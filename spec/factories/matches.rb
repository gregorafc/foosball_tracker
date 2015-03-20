FactoryGirl.define do
  factory :match do
    match_date { Faker::Date.backward(50) }
    association :home_player, factory: :player
    association :away_player, factory: :player
    home_player_win { rand(2) == 1 }
    looser_score { rand(10) }
  end

end
