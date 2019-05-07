class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show]

  def index 
    @favorites = Favorite.all 
  end 

  def show
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.list = List.find(params[:list])
    @favorite.user = current_user
    if @favorite.save
      redirect_to lists_path #vai para index
    else 
      render list_path(params[:list]) #continua na mesma lista
    end
  end 

  private
    def favorite_params 
      params.permit(:user_id, :list_id)
    end 

    def set_favorite
      @favorite = Favorite.find(params[:id])
    end
end
