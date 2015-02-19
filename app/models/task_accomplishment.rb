class TaskAccomplishment < ActiveRecord::Base
  after_create do
    self.delay.add_to_accounts_segment
    AppMailer.delay.poke_gilmar_mendes(self) if self.task.slug.to_sym == :poke_gilmar_mendes
    AppMailer.delay.poke_rodrigo_janot(self) if self.task.slug.to_sym == :poke_rodrigo_janot;
    AppMailer.delay.poke_carlos_zarattini(self) if self.task.slug.to_sym == :poke_carlos_zarattini
    AppMailer.delay.thanks(self) if self.task.slug.to_sym == :poke_gilmar_mendes
  end

  belongs_to :user
  belongs_to :task

  validates :user_id, :task_id, presence: true
  validates :user_id, uniqueness: { scope: :task_id }

  accepts_nested_attributes_for :user

  def add_to_accounts_segment
    begin
      url = "#{ENV["ACCOUNTS_HOST"]}/users/#{self.user_id}/segment_subscriptions.json"

      body = {
        token: ENV["ACCOUNTS_API_TOKEN"],
        segment_subscription: {
          organization_id: ENV['MEURIO_ORGANIZATION_ID'],
          segment_id: self.task.mailchimp_list_uid
        }
      }

      HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    rescue Exception => e
      logger.error e.message
    end
  end
end
