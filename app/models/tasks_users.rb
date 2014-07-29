class TasksUsers < ActiveRecord::Base
  before_create :add_to_accounts_segment

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
