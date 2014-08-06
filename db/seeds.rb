# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create!(
  name: "Enviar email para ministro do STF",
  mission: "Missão 1",
  mailchimp_list_uid: "1a",
  slug: "poke_gilmar_mendes",
  position: 1
)

Task.create!(
  name: "Enviar email para Procurador Geral",
  mission: "Missão 2",
  mailchimp_list_uid: "1b",
  slug: "poke_rodrigo_janot",
  position: 2
)

Task.create!(
  name: "Espalhar mobilização no Facebook",
  mission: "Missão 3",
  mailchimp_list_uid: "1c",
  slug: "share_on_facebook",
  position: 3
)
