module ApplicationHelper
  def task_button_class task, accomplished_tasks, current_task
    classes = []

    if accomplished_tasks.include?(task)
      classes << "accomplished" << "icon-checkmark"
    end

    if task == current_task
      classes << "current" << "bubble"
    end

    if task.slug == "poke_gilmar_mendes" || task.slug == "poke_rodrigo_janot"
      classes << "icon-mail2"
    end

    if task.slug == "share_on_facebook"
      classes << "icon-facebook"
    end

    return classes
  end
end
