class Task < ActiveRecord::Base
  validates :mailchimp_list_uid, :position, :name, :mission, presence: true
  validates :slug, uniqueness: true

  has_many :task_accomplishments
  has_many :users, through: :task_accomplishment
  acts_as_list
end

# validate uniqueness of position
# criar slug
# after_create TaskAccomplishment -> if self.task.slug(:poke_gilmar_mendes)
# partial para cada tarefa #id será o #slug
