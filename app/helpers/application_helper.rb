module ApplicationHelper
  def task_button_class task, accomplished_tasks, current_task
    classes = []

    if accomplished_tasks.include?(task)
      classes << "accomplished" << "icon-checkmark"
    elsif task == current_task
      classes << "current" << "bubble"

      if(
        task.slug == "poke_gilmar_mendes" ||
        task.slug == "poke_rodrigo_janot" ||
        task.slug == "poke_carlos_zarattini")
        classes << "icon-mail2"
      elsif task.slug == "share_on_facebook"
        classes << "icon-facebook"
      elsif task.slug == "share_on_twitter"
        classes << "icon-twitter"
      end
    else
      classes << "icon-locked"
    end

    return classes
  end
end
