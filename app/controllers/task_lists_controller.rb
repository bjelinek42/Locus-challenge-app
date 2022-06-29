class TaskListsController < ApplicationController
  before_action :set_task_list, only: %i[ show edit update destroy ]

  add_breadcrumb "Home", :root_path

  def index
    @task_lists = TaskList.all
    # add_breadcrumb "Index", :task_list_tasks_path
  end

  def show
    name = @task_list.name
    render json: {name => @task_list.tasks}
  end

  def new
    add_breadcrumb "Create New Task List"
    @task_list = TaskList.new
  end

  def edit
    add_breadcrumb "Edit #{@task_list.name}"
  end

  def create #failure in test occuring here, but name is already taken when it tries to save so throws a failure, but I cannot figure out how to fix it
    
    @task_list = TaskList.new(task_list_params)
    p task_list_params
    p @task_list
    
    if @task_list.save
      redirect_to task_lists_url, notice: "Task list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task_list.update(task_list_params)
      redirect_to task_lists_url, notice: "Task list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task_list.destroy

    redirect_to task_lists_url, notice: "Task list was successfully destroyed."
  end

  private
    def set_task_list
      @task_list = TaskList.find(params[:id])
    end

    def task_list_params
      params.require(:task_list).permit(:name)
    end
end
