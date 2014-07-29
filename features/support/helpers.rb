def to_route string
  return root_path if string == "the homepage"
  raise "I don't know route '#{string}'"
end

def to_element string
  return "tasks_users[user][first_name]" if string == "the first name field"
  return "tasks_users[user][last_name]" if string == "the last name field"
  return "tasks_users[user][email]" if string == "the email field"
  raise "I don't know element '#{string}'"
end

def to_button string
  return "poke_gilmar_mendes_button" if string == "the poke Gilmar Mendes submit button"
  raise "I don't know button '#{string}'"
end
