class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user_dashboard_path # Redirect on user dashboard
  end

  rescue_from ActionController::InvalidAuthenticityToken do
    reset_session
    redirect_to root_path, alert: "Your session has expired. Please sign in again."
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:provider, :name, :bio, :photo, :team_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
    end
end
