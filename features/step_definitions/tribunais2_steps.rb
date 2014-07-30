Then(/^an email from "(.*?)" to Gilmar Mendes should be sent just once$/) do |arg1|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(ENV['GILMAR_MENDES_EMAIL']) && mailer.from.include?(arg1)
  end

  expect(emails).to have(1).email
end

Then(/^I should see "(.*?)" task$/) do |arg1|
  expect(page).to have_css("#poke_rodrigo_janot")
end

Given(/^there is a task for poke Gilmar Mendes$/) do
  Task.create! index: 1, mailchimp_list_uid: "123", name: "Task name"
end

Given(/^there is an user with email "(.*?)"$/) do |arg1|
  @user = User.create! email: arg1
end

Given(/^this user already poked Gilmar Mendes$/) do
  TaskAccomplishment.create! user_id: @user.id, task_id: Task.first.id
end
