require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:tasks) }
  it { should have_many(:task_accomplishments) }
end
