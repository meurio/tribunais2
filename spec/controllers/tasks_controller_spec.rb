require 'rails_helper'

RSpec.describe TasksController, :type => :controller do

  describe "GET index" do
    before { @task1 = Fabricate(:task, position: 1) }
    before { @task2 = Fabricate(:task, position: 2) }
    
    it "should initialize @task_accomplishment" do
      get :index
      expect(assigns(:task_accomplishment)).to be_instance_of(TaskAccomplishment)
    end

    it "should assign @tasks" do
      get :index
      expect(assigns(:tasks)).to have(2).tasks
    end

    context "when the user exists" do
      before { @user = Fabricate(:user) }
      subject { get(:index, login: {email: @user.email}) }

      it "logs the user in" do
        get(:index, login: {email: @user.email})
        expect(session[:user_id]).to eq @user.id
      end

      it "redirects the user" do
        expect(subject).to redirect_to(root_path(anchor: "tasks-panel"))
      end
    end

    context "when the user does not exists" do
      subject { get(:index, login: {email: 'any@email.fake'}) }

      it "shows an alert message" do
        expect(subject.request.flash[:alert]).to_not be_nil
      end

      it "redirects to root path" do
        expect(subject).to redirect_to(root_path)
      end

      it "should assign the first task to @current_task" do
        get :index
        expect(assigns(:current_task)).to eq(@task1)
      end
    end

    context "when the user is logged in" do
      let(:user) { Fabricate(:user) }
      before { session[:user_id] = user.id }

      context "when the user has accomplished at least one task" do
        before { Fabricate(:task_accomplishment, user: user, task: @task1) }

        it "should assign the first unaccomplished task to @current_task" do
          get :index
          expect(assigns(:current_task)).to eq(@task2)
        end

        it "should assign user accomplished tasks to @accomplished_tasks" do
          get :index
          expect(assigns(:accomplished_tasks)).to include(@task1)
        end
      end

      context "when the user hasn't accomplished any task" do        
        it "should assign the first task to @current_task" do
          get :index
          expect(assigns(:current_task)).to eq(@task1)
        end

        it "should assign an empty array to @accomplished_tasks" do
          get :index
          expect(assigns(:accomplished_tasks)).to be_empty
        end
      end      
    end

    context "when the user is not logged in" do
      it "should assign an empty array to @accomplished_tasks" do
        get :index
        expect(assigns(:accomplished_tasks)).to be_empty
      end
    end
  end
end
