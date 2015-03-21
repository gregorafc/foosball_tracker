class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path, notice: 'Match was succesfully created.'
    else
      render :new
    end
  end


  private

  def match_params
    params.require(:match).permit(:match_date,
                                  :home_player_id,
                                  :away_player_id,
                                  :home_player_win,
                                  :looser_score)
  end

end
