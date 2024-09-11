class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionController::InvalidAuthenticityToken do
    reset_session
    redirect_to root_path, alert: "Your session has expired. Please sign in again."
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    current_user
    if !session[:user_id] && @current_user.nil? && request.path != root_path
      redirect_to root_path, notice: 'You need to sign in first.'
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :bio, :photo, :team_id])
    end
end
