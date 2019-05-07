class List < ApplicationRecord
  before_action :set_list, only: [:show, :edit, :update, :destroy]

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
    flash[:dange] = "Lista deletada."
    redirect_to lists_path
  end

  private
    def set_list
      @list = List.find(params[:id])
    end 

    def list_params 
      params.require(:list).permit(:list_title)
    end 
  
end
