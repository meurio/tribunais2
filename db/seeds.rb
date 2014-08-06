# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create(
  name: "Enviar email para ministro do STF",
  mission: "Missão 1",
  mailchimp_list_uid: "1a",
  slug: "poke_gilmar_mendes",
  position: 1,
  description: "O ministro do STF Gilmar Mendes, relator da ADPF 289, é o responsável pela análise mais detalhada do processo e pelo primeiro voto. Ou seja: é fundamental que ele saiba desde já que a sociedade quer o fim do julgamento de civis por tribunais militares."
)

Task.create(
  name: "Enviar email para Procurador Geral",
  mission: "Missão 2",
  mailchimp_list_uid: "1b",
  slug: "poke_rodrigo_janot",
  position: 2,
  description: "Agora que você já pressionou o relator da ADPF 289, envie também uma mensagem para o Procurador Geral da República, Rodrigo Janot. É ele quem vai emitir a opinião do Ministério Público, e sua voz tem grande poder de influência sobre os ministros do STF. A pressão dos setores autoritários em cima do procurador é grande. Precisamos contra-atacar!"
)

Task.create(
  name: "Espalhar mobilização no Facebook",
  mission: "Missão 3",
  mailchimp_list_uid: "1c",
  slug: "share_on_facebook",
  position: 3,
  description: "Temos que ter a participação de milhares de cidadãos para que a pressão popular seja mais forte que a influência dos setores autoritários. Compartilhe agora a página da mobilização e convoque seus amigos para a missão pela desmilitarização da justiça."
)
