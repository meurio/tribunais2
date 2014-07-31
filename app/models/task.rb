class Task < ActiveRecord::Base
  validates :mailchimp_list_uid, :index, :name, :mission, presence: true
  
  has_many :task_accomplishments
  has_many :users, through: :task_accomplishment
end
