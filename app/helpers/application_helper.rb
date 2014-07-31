module ApplicationHelper
  def task_button_class task, accomplished_tasks
    if accomplished_tasks.include?(task)
      "accomplished icon-checkmark"
    else
      "icon-mail2"
    end
  end
end
