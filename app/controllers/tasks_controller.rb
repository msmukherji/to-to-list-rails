class TasksController < ApplicationController
  before_action :authenticate_user!
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
    #validate format of input
    @task.save!
    redirect_to lists_path
  end

  def done
    t = Task.find(params[:item_id])
    t.update! completed: true
    #tdl = ToDoList.find(t.to_do_list_id)
    #redirect_to lists_path
    redirect_to lists_path t.to_do_list_id
    #this does something weird
    #I think because it goes back to show function, 
    #and keeps id as list_id and shows you that list
    #instead.  why?  
  end
end