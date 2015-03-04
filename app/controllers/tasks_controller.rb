#require 'pry'

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

  def delete
    @task = Task.find params[:id]
    list_id = @task.to_do_list_id
    @task.delete
    redirect_to lists_path list_id
  end

  def random
    lists = current_user.to_do_lists
    unfinisheditems = []
    tasks = Task.where(completed: false)
    tasks.each do |task|
      if lists.where(id: task.to_do_list_id).count > 0
        unfinisheditems << task
      end
    end
    @randomitem = unfinisheditems.sample
    render :random
  end

  def new_search
    render :search
  end

  def search
    lists = current_user.to_do_lists
    @possible_tasks = []
    Task.all.each do |task|
        
      if lists.where(id: task.to_do_list_id).count > 0
        if task.name.include? params[:name]
          @possible_tasks << task
        end
      end
    end

    if @possible_tasks.count > 0
      render :search_results
    else
      render :no_results
    end
  end

end