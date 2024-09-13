class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # Prevent CSRF attacks by raising an exception.
  before_action :configure_permitted_parameters, if: :devise_controller? # Devise strong parameters

  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirect to root path after sign out
  end

  def after_sign_in_path_for(user)
    user_dashboard_path # Redirect on user dashboard
  end

  rescue_from ActionController::InvalidAuthenticityToken do
    reset_session
    redirect_to root_path, alert: "Your session has expired. Please sign in again."
  end

  rescue_from ActiveRecord::StatementInvalid do
    redirect_to root_path, alert: "An error has occurred. Please try again."
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:provider, :name, :bio, :photo, :team_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
    end
end
