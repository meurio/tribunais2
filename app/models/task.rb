class Task < ActiveRecord::Base
  validates :mailchimp_list_uid, :index, :name, :mission, presence: true
end
