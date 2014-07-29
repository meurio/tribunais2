class Task < ActiveRecord::Base
  validates :mailchimp_list_uid, :index, presence: true
end
