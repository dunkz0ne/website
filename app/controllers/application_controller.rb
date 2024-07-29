class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    if (session[:user_created] || !session[:user_id] ) && !current_user && request.path != root_path
      redirect_to root_path, notice: 'You need to sign in first.'
    end
  end
end
