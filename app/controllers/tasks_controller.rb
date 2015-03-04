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
   
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update name: params[:task][:name], due: params[:task][:due]
      redirect_to lists_path @task.to_do_list_id
    else
      render :edit
    end
  end
end