class AppMailer < ActionMailer::Base
  default from: "from@example.com"

  def poke_gilmar_mendes tasks_user
    mail(to: ENV['GILMAR_MENDES_EMAIL'], from: tasks_user.user.email, subject: 'Pressão!')
  end
end
