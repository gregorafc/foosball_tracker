module MatchesHelper

  def match_result_home(match)
    if match.home_player_win == true
      10
    else
      match.looser_score 
    end 
  end

  def match_result_away(match)
    if match.home_player_win == false
      10
    else
      match.looser_score
    end
  end
end
