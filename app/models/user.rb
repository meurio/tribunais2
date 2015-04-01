class User < ActiveRecord::Base
  acts_as_our_cities_user
  validates :email, uniqueness: true

  has_many :task_accomplishments
  has_many :tasks, -> { order("position ASC") }, through: :task_accomplishments

  # Move it to the acts_as_our_cities_user gem
  attr_accessor :password, :memberships_attributes

  def unaccomplished_tasks
    Task
      .joins("LEFT OUTER JOIN task_accomplishments ON tasks.id = task_accomplishments.task_id AND task_accomplishments.user_id = #{self.id}")
      .where("task_accomplishments.id IS NULL")
  end
end
