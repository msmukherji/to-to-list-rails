class ToDoListsController < ApplicationController
  def show
    @list = ToDoList.find(params[:id])
    @items = Task.where(to_do_list_id = params[:id])
    render :show
  end

  def show_all
    @finisheditems = Task.all
    @unfinisheditems = Task.where(completed=false)
    render :show_all
  end

  def new_list
    @list = ToDoList.new
    render :new_list
  end

  def add_list
    list_params = params[:to_do_list]
    @list = ToDoList.new name: list_params[:name]
    @list.save!
    redirect_to '/'
  end

  def new_task 
    @task = Task.new
    render :new
  end

  def add_task
    task_params = params[:task]
    binding.pry
    t = ToDoList.find_or_create_by! id: params[:id]
    list_id = t.id
    @task = Task.new name: task_params[:name], due: task_params[:due], to_do_list_id: list_id
    @task.save!
    redirect_to lists_path
  end

    # def create
    # board_params = params[:board]
    # @board = Board.new title: board_params[:title], subtitle: board_params[:subtitle]
    # # @board = Board.new params[:board] <- need "Strong params"
    # if @board.save
    #   redirect_to board_path(@board) # "/boards/#{board.id}"
    # else
    #   # Do stuff
    #   render :new
    # end

  # def create
  #   list = List.find_or_create_by!
  # end
end