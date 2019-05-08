class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :get_user_favorite, only: [:show]

  def index
    @lists = List.all
  end

  def new 
    @list = List.new
  end

  def show
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      flash[:success] = "Lista criada com sucesso."
      redirect_to @list 
    else
      render 'new'
    end
  end

  def update
    if @list.update(list_params)
      flash[:success] = "Lista atualizada com sucesso."
      redirect_to @list 
    else 
      render 'edit'
    end
  end

  def destroy
    @list.destroy 
    flash[:danger] = "Lista deletada."
    redirect_to lists_path
  end

  private
    def set_list
      @list = List.find(params[:id])
    end 

    def list_params 
      params.require(:list).permit(:list_title, :is_private)
    end 

    def get_user_favorite
      @get_favorite = Favorite.where({user_id: current_user, list_id: @list.id})
    end
end
