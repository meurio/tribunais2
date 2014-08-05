require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:tasks) }
  it { should have_many(:task_accomplishments) }

  describe '.unnacomplished_tasks' do
    subject { Fabricate(:user) }
    before { @task1 = Fabricate(:task, position: 1) }
    before { @task2 = Fabricate(:task, position: 2) }

    context 'when the user has accomplished at least one task' do
      before { Fabricate(:task_accomplishment, user: subject, task: @task1) }

      it 'should return the unaccomplished task' do
        expect(subject.unaccomplished_tasks).to include(@task2)
      end

      it 'should not return the accomplished task' do
        expect(subject.unaccomplished_tasks).to_not include(@task1)
      end
    end

    context 'when the user has not accomplished any tasks' do
      it 'should return the unaccomplished tasks' do
        expect(subject.unaccomplished_tasks).to have(2).tasks
      end
    end
  end
end
