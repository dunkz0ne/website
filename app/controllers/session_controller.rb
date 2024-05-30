class SessionController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.from_omniauth(auth)
    if not user.nil?
      session[:user_id] = user.id
      flash[:notice] = 'Logged in!'
      @current_user = user.id
      redirect_to dashboard_path
    else
      redirect_to new_user_path(id: auth.uid, name: auth.info.name, email: auth.info.email)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out!'
    redirect_to root_path
  end

  def fail
    redirect_to root_path
  end
end