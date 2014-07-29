class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :login_via_email

  def login_via_email
    if params[:login_email].present?
      if @user = User.find_by email: params[:login_email]
        redirect_to root_path
      else
        redirect_to root_path, notice: 'O usuário não foi encontrado'
      end
    end
  end
end
