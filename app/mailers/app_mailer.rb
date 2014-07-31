class AppMailer < ActionMailer::Base
  default from: "from@example.com"

  def poke_gilmar_mendes tasks_user
    headers "X-SMTPAPI" => "{ \"category\": [\"tribunais2\", \"poke_gilmar_mendes\"] }"
    mail(
      to: ENV['GILMAR_MENDES_EMAIL'],
      from: tasks_user.user.email,
      subject: 'Ministro Gilmar Mendes, vote a favor da ADPF 289'
    )
  end
end
