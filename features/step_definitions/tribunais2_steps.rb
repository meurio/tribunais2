Then(/^an email from "(.*?)" to Gilmar Mendes should be sent$/) do |arg1|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(ENV['GILMAR_MENDES_EMAIL']) && mailer.from.include?(arg1)
  end

  expect(emails).to_not be_empty
end

Then(/^I should see "(.*?)" task$/) do |arg1|
  expect(page).to have_css("#poke_rodrigo_janot")
end

Given(/^there is a task for poke Gilmar Mendes$/) do
  Task.create! index: 1
end
