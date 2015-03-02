class ToDoListsController < ApplicationController
  def show
    @list = ToDoList.find(params[:id])
    @items = Task.where(to_do_list_id = params[:id])
    render :show
  end

  # def create
  #   list = List.find_or_create_by!
  # end
end