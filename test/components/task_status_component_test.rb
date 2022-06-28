require "test_helper"

class TaskStatusComponentTest < ViewComponent::TestCase
  setup do
    @task = tasks(:one)
  end

  def test_renders_the_form_to_complete_the_task
    assert_equal(
      %(<i class=\"red fa fa-times\"></i>),
      render_inline(TaskStatusComponent.new(@task)).to_html
    )
  end

  def test_renders_the_form_uncheck_the_task
    @task.update(complete: true)
    assert_equal(
      %(<i class=\"green fa fa-check\"></i>),
      render_inline(TaskStatusComponent.new(@task)).to_html
    )
  end
end
