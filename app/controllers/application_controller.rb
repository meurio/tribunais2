class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :login_via_email

  helper_method :current_user

  def login_via_email
    if params[:login].present?
      if session[:user_id] = User.find_by(email: params[:login][:email]).try(:id)
        redirect_to root_path(anchor: "tasks-panel")
      else
        redirect_to root_path, alert: 'Seu email não foi encontrado. Inscreva-se no formulário abaixo para participar das missões!'
      end
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end
end
