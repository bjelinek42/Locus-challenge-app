require "test_helper"

class TaskActionComponentTest < ViewComponent::TestCase
  setup do
    @task = tasks(:one)
  end

  def test_renders_the_form_to_complete_the_task
    assert_equal(
      %(<form class=\"button_to\" method=\"post\" action=\"/task_lists/980190962/tasks/980190962?task%5Bcomplete%5D=true\">
<input type=\"hidden\" name=\"_method\" value=\"put\" autocomplete=\"off\"><button title=\"complete\" class=\"green\" type=\"submit\"><i class=\"fas fa-check\"></i></button>
</form>),
      render_inline(TaskActionComponent.new(@task)).to_html
    )
  end

  def test_renders_the_form_uncheck_the_task
    @task.update(complete: true)
    assert_equal(
      %(<form class=\"button_to\" method=\"post\" action=\"/task_lists/980190962/tasks/980190962?task%5Bcomplete%5D=false\">
<input type=\"hidden\" name=\"_method\" value=\"put\" autocomplete=\"off\"><button title=\"undo\" class=\"yellow\" type=\"submit\"><i class=\"fas fa-times\"></i></button>
</form>),
      render_inline(TaskActionComponent.new(@task)).to_html
    )
  end
end
