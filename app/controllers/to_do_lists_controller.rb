class ToDoListsController < ApplicationController
  before_action :authenticate_user!
  def show
    @list = ToDoList.find(params[:id])
    @items = Task.where(to_do_list_id: @list.id)
    render :show
  end

  def show_all
    @lists = ToDoList.all
    @finisheditems = Task.all
    @unfinisheditems = Task.where(completed: nil || false)
    render :show_all
  end

  def new_list
    # user = User.find(params[:id]) 
    @list = ToDoList.new
    render :new_list
  end

  def add_list
    list_params = params[:to_do_list]
    @list = ToDoList.new name: list_params[:name], user_id: current_user.id

    @list.save!
    redirect_to '/'
  end

  

end