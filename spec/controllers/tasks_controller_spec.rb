require 'rails_helper'

RSpec.describe TasksController, :type => :controller do

  describe "GET index" do
    context "when the user exists" do
      before { @user = Fabricate(:user) }
      subject { get(:index, login_email: @user.email) }

      it "logs the user in" do
        get(:index, login_email: @user.email)
        expect(session[:user_id]).to eq @user.id
      end

      it "redirects the user" do
        expect(subject).to redirect_to(root_path)
      end
    end

    context "when the user does not exists" do
      subject { get(:index, login_email: 'any@email.fake') }

      it "shows an alert message" do        
        expect(subject.request.flash[:alert]).to_not be_nil
      end

      it "redirects to root path" do
        expect(subject).to redirect_to(root_path)
      end
    end
  end
end
