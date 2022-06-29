# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task_list
  before_action :set_task, only: %i[ show edit update destroy ]

  add_breadcrumb "All Lists", :root_path

  def show
    @task
  end

  def index
    @tasks = @task_list.tasks
    add_breadcrumb "#{@task_list.name}"
  end

  def new
    @task = @task_list.tasks.new
    add_breadcrumb "#{@task_list.name}"
    add_breadcrumb "New Task"
  end

  def edit
    add_breadcrumb "#{@task_list.name}", :task_list_tasks_path
    add_breadcrumb "Edit Task"
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_list_tasks_url(@task.task_list), notice: "Task was successfully created." #removed "edit"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_list_tasks_path(@task_list), notice: "Task was successfully updated." #changed to expected path in test
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    redirect_to task_list_tasks_url(@task.task_list), notice: "Task was successfully destroyed." #changed to expected path in test
  end

  private
    def set_task
      @task = @task_list.tasks.find(params[:id])
    end

    def set_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end

    def task_params
      params.require(:task).permit(:task_list_id, :description, :due_date, :complete) #needs to have complete == false at creation
      #tried complete: :false, complete: false, added to require
    end
end
