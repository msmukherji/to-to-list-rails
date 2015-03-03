class ToDoListsController < ApplicationController
  def show
    @list = ToDoList.find(params[:id])
    @items = Task.where(to_do_list_id: @list.id)
    render :show
  end

  def show_all
    @lists = ToDoList.all
    @finisheditems = Task.all
    @unfinisheditems = Task.where(completed: nil)
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
    @list = ToDoList.find(params[:id]) 
    @task = Task.new
    render :new
  end

  def add_task
    task_params = params[:task]
    t = ToDoList.find_or_create_by! id: params[:id]
    list_id = t.id
    @task = Task.new name: task_params[:name], due: task_params[:due], to_do_list_id: list_id
    @task.save!
    redirect_to lists_path
  end

  def done
    t = Task.find(params[:item_id])
    t.update! completed: true
    #tdl = ToDoList.find(t.to_do_list_id)

    redirect_to lists_path
    #this does something weird
    #I think because it goes back to show function, 
    #and keeps id as list_id and shows you that list
    #instead.  why?  
  end

end