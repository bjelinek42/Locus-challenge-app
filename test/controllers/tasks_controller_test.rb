require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get task_list_tasks_url(@task.task_list)
    assert_response :success
  end

  test "should get new" do
    get new_task_list_task_url(@task.task_list)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post task_list_tasks_url(@task.task_list), params: { task: { complete: @task.complete, description: @task.description, due_date: @task.due_date, task_list_id: @task.task_list_id } }
    end

    assert_redirected_to task_list_tasks_url(@task.task_list)
  end

  test "should get edit" do
    get edit_task_list_task_url(@task.task_list, @task)
    assert_response :success
  end

  test "should update task" do
    patch task_list_task_url(@task.task_list, @task), params: { task: { complete: @task.complete, description: @task.description, due_date: @task.due_date, task_list_id: @task.task_list_id } }
    assert_redirected_to task_list_tasks_url(@task.task_list)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_list_task_url(@task.task_list, @task)
    end

    assert_redirected_to task_list_tasks_url(@task.task_list)
  end
end
