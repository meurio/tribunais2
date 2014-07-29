Given(/^I'm in "(.*?)"$/) do |arg1|
  visit to_route(arg1)
end

Given(/^I fill "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in to_element(arg1), with: arg2
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button to_button(arg1)
end

Then(/^I should be in "(.*?)"$/) do |arg1|
  expect(current_path).to be_== to_route(arg1)
end
