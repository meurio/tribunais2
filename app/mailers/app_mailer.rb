class AppMailer < ActionMailer::Base
  include AbstractController::Callbacks
  default from: "Guilherme - Meu Rio <guilherme@meurio.org.br>"
  layout "mail"

  before_filter { @organization = Organization.find_by_slug("meurio") }

  def poke_gilmar_mendes tasks_user
    @user = tasks_user.user
    headers "X-SMTPAPI" => "{ \"category\": [\"tribunais2\", \"poke_gilmar_mendes\"] }"
    mail(
      to: ENV['GILMAR_MENDES_EMAIL'],
      from: tasks_user.user.email,
      subject: 'Ministro Gilmar Mendes, vote a favor da ADPF 289'
    )
  end

  def poke_rodrigo_janot tasks_user
    @user = tasks_user.user
    headers "X-SMTPAPI" => "{ \"category\": [\"tribunais2\", \"poke_rodrigo_janot\"] }"
    mail(
      to: ENV['RODRIGO_JANOT_EMAIL'],
      from: tasks_user.user.email,
      subject: 'Procurador Janot, dê parecer favorável à ADPF 289'
    )
  end

  def thanks task_accomplishment
    headers "X-SMTPAPI" => "{ \"category\": [\"tribunais2\", \"thanks\"] }"
    mail(
      to: task_accomplishment.user.email,
      subject: 'Obrigado por participar da missão pela desmilitarização da justiça'
    )
  end
end
