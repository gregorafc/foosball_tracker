class MatchesController < ApplicationController
  before_filter :authorize, only: [:new]

  def index
    @matches = Match.paginate(:page => params[:page], :per_page => 10).order('match_date desc')
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
