class TasksUser < ActiveRecord::Base
  after_create { self.delay.add_to_accounts_segment }
  after_create { AppMailer.delay.poke_gilmar_mendes(self) }

  belongs_to :user

  accepts_nested_attributes_for :user

  def add_to_accounts_segment
    begin
      url = "#{ENV["ACCOUNTS_HOST"]}/users/#{self.user_id}/segment_subscriptions.json"

      body = {
        token: ENV["ACCOUNTS_API_TOKEN"],
        segment_subscription: {
          organization_id: Organization.find_by_slug('meurio').id,
          segment_id: self.task.mailchimp_list_uid
        }
      }

      HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    rescue Exception => e
      logger.error e.message
    end
  end
end
