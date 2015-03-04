class ToDoListsController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.to_do_lists.count > 0

    @list = current_user.to_do_lists.find(params[:id])
    @items = Task.where(to_do_list_id: @list.id)
    end
    render :show
  end

  def show_all
      @lists = current_user.to_do_lists
      @unfinisheditems = []
      tasks = Task.where(completed: false)
      tasks.each do |task|
        if @lists.where(id: task.to_do_list_id).count > 0
          @unfinisheditems << task
        end
      end
      # @tasks = tasks.where()
      # #@lists = ToDoList.all
      # @unfinisheditems = @lists.tasks.where(completed: nil || false)
      render :show_all
  end

  def new_list 
    @list = ToDoList.new
    render :new_list
  end

  def add_list
    list_params = params[:to_do_list]
    @list = current_user.to_do_lists.new name: list_params[:name], user_id: current_user.id
    @list.save!
    redirect_to '/'
  end

  def edit
    @list = ToDoList.find params[:id]
  end

  def update
    @list = ToDoList.find params[:id]
    if @list.update name: params[:to_do_list][:name]
      redirect_to '/'
    else
      render :edit
    end
  end

  def delete
    @list = ToDoList.find params[:id]
    @list.delete
    redirect_to '/'
  end
end