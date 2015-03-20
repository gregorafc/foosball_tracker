class PlayersController < ApplicationController
  before_filter :set_player, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:new, :edit, :destroy ]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: 'Player was succesfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: 'Player was succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path, notice: 'Player was succesfully deleted.'
  end

  def rank
    @players = Player.rating_table
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:firstname, :lastname, :avatar)
  end

end
