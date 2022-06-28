# frozen_string_literal: true

class TaskActionComponent < ViewComponent::Base
  def initialize(task)
    @task = task
    @task_list = task.task_list
  end

  def call
    if @task.complete?
      button_to task_list_task_path(@task_list, @task, task: { complete: false }), method: :put, title: "undo", class: "yellow" do
        tag.i class: "fas fa-times"
      end
    else
      button_to task_list_task_path(@task_list, @task, task: { complete: true }), method: :put, title: "complete", class: "green" do
        tag.i class: "fas fa-check"
      end
    end
  end
end
