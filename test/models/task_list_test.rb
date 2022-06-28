require "test_helper"

class TaskListTest < ActiveSupport::TestCase
  test "valid task list" do
    task_list = TaskList.new(name: 'to do list')
    assert task_list.valid?
  end

  test "validates task list name presence" do
    task_list = TaskList.new(name: '')
    assert task_list.invalid?
  end

  test "validates task list name uniqueness" do
    task_list = TaskList.create(name: 'chores')
    new_task_list = TaskList.new(name: 'chores')
    assert new_task_list.invalid?
  end
end
