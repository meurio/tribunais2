Then(/^an email from "(.*?)" to Gilmar Mendes should be sent just once$/) do |arg1|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(ENV['GILMAR_MENDES_EMAIL']) && mailer.from.include?(arg1)
  end

  expect(emails).to have(1).email
end

Given(/^this user already poked Gilmar Mendes$/) do
  Fabricate(:task_accomplishment, user: @user, task: Task.first)
end

Then(/^I should see "(.*?)" task accomplished$/) do |arg1|
  expect(page).to have_css(".tasks-menu li#poke_gilmar_mendes.accomplished")
end

Then(/^I should see "(.*?)" task$/) do |arg1|
  expect(page).to have_css("#poke_rodrigo_janot")
end
