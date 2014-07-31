Fabricator(:user) do
  first_name 'Josias'
  last_name 'Schneider'
  email { sequence(:email) {|i| "josias#{i}@test.com" } }
end

Fabricator(:task) do
  index { sequence(:index) }
  mailchimp_list_uid { sequence(:mailchimp_list_uid) }
  name { sequence(:name) {|i| "Task #{i}"} }
  mission 'Mission'
end

Fabricator(:task_accomplishment) do
  user
  task
end
