class TasksController < ApplicationController
  before_action :set_list, only: [:create, :destroy]

  def create 
    @task = @list.tasks.create(task_params)
    redirect_to list_path(@list)
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    @task.destroy 
    redirect_to list_path(@list)
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def task_params 
      params.require(:task).permit(:task_title)
    end
end