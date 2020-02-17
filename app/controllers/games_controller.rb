class GamesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @game= Game.new    
  end

  def index
    p "asdasd"
    @games=Game.all
  end
 
  def show
  end

  def create
    ga=Game.new(game_params)
    if ga.save
      redirect_to games_path
    else
      print "not saved"
    end
  end
  
  def update
  end

  def destroy
  end

  private
  def game_params
    params.require(:game).permit(:name,:number_of_players)
  end

end
