def to_route string
  return root_path if string == "the homepage"
  raise "I don't know route '#{string}'"
end

def to_field string
  return "task_accomplishment_user_attributes_first_name" if string == "the first name field"
  return "task_accomplishment_user_attributes_last_name" if string == "the last name field"
  return "task_accomplishment_user_attributes_email" if string == "the email field"
  return "login_email" if string == "the login email field"
  raise "I don't know field '#{string}'"
end

def to_button string
  return "poke_gilmar_mendes_button" if string == "the poke Gilmar Mendes submit button"
  return "poke_rodrigo_janot_button" if string == "the poke Rodrigo Janot submit button"
  return "login_button" if string == "the login submit button"
  return "share_on_facebook_button" if string == "share on Facebook button"
  return "share_on_twitter_button" if string == "share on Twitter button"
  raise "I don't know button '#{string}'"
end

def to_element string
  return ".first-name-field.error" if string == "the first name field error"
  return ".last-name-field.error" if string == "the last name field error"
  return ".email-field.error" if string == "the email field error"
  raise "I don't know element '#{string}'"
end

def to_link string
  return "login-link" if string == "the login link"
  return "logout-link" if string == "the logout link"
  raise "I don't know link '#{string}'"
end
