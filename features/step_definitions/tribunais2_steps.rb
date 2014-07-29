Then(/^my email to Gilmar Mendes should be sent$/) do
  ActionMailer::Base.deliveries.select do |mailer|
    mailer.to == ENV['GILMAR_MENDES_EMAIL'] && mailer.from == current_user.email
  end.any?
end

Then(/^I should see "(.*?)" task$/) do |arg1|

end

Given(/^there is a task for poke Gilmar Mendes$/) do
  Task.create! index: 1
end
