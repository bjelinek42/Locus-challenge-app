# frozen_string_literal: true

class TaskStatusComponent < ViewComponent::Base
  def initialize(task)
    @task = task
  end

  def call
    if @task.complete?
      tag.i class: "green fa fa-check"
    else
      tag.i class: "red fa fa-times"
    end
  end
end
