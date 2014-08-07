module ApplicationHelper
  def task_button_class task, accomplished_tasks, current_task
    classes = []

    if task == current_task
      classes << "current" << "bubble"
    end

    if accomplished_tasks.include?(task)
      classes << "accomplished" << "icon-checkmark"
    elsif task.slug == "poke_gilmar_mendes" || task.slug == "poke_rodrigo_janot"
      classes << "icon-mail2"
    elsif task.slug == "share_on_facebook"
      classes << "icon-facebook"
    elsif task.slug == "share_on_twitter"
      classes << "icon-twitter"
    end

    return classes
  end
end
