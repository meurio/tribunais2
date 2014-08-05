require 'rails_helper'

RSpec.describe Task, :type => :model do
  it { should validate_presence_of :mailchimp_list_uid }
  it { should validate_presence_of :position }
  it { should validate_presence_of :name }
  it { should validate_presence_of :mission }
end
