class User < ActiveRecord::Base
  validates :email, uniqueness: true

  has_many :task_accomplishments
  has_many :tasks, -> { order("position ASC") }, through: :task_accomplishments

  # TODO: move this method to a gem
  def self.create params
    if Rails.env.production? || Rails.env.staging?
      begin
        url = "#{ENV["ACCOUNTS_HOST"]}/users.json"

        user_hash = {
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          password: SecureRandom.hex,
          ip: params[:ip],
          memberships_attributes: [{organization_id: ENV['MEURIO_ORGANIZATION_ID']}]
        }

        body = { token: ENV["ACCOUNTS_API_TOKEN"], user: user_hash }
        response = HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
        User.find_by_id(response['id'])
      rescue Exception => e
        logger.error e.message
      end
    else
      super
    end
  end

  def unaccomplished_tasks
    Task.order(position: :asc) - self.tasks
    # Task.joins("LEFT OUTER JOIN task_accomplishments ON tasks.id = task_accomplishments.task_id AND task_accomplishments.user_id = ?", self.id).where("task_accomplishments.id IS NULL")
  end
end
