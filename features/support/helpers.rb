def to_route string
  return root_path if string == "the homepage"
  raise "I don't know route '#{string}'"
end

def to_field string
  return "task_accomplishment_user_attributes_first_name" if string == "the first name field"
  return "task_accomplishment_user_attributes_last_name" if string == "the last name field"
  return "task_accomplishment_user_attributes_email" if string == "the email field"
  raise "I don't know field '#{string}'"
end

def to_button string
  return "poke_gilmar_mendes_button" if string == "the poke Gilmar Mendes submit button"
  raise "I don't know button '#{string}'"
end

def to_element string
  return ".first-name-field.error" if string == "the first name field error"
  return ".last-name-field.error" if string == "the last name field error"
  return ".email-field.error" if string == "the email field error"
  raise "I don't know element '#{string}'"
end
