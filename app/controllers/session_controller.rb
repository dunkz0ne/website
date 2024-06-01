class SessionController < ApplicationController
  def create
    # auth = request.env['omniauth.auth']
    # user = User.from_omniauth(auth)
    # if not user.nil?
    #   session[:user_id] = user.id
    #   flash[:notice] = 'Logged in!'
    #   @current_user = user.id
    #   redirect_to root_path
    # else
    #   session["devise.facebook_data"] = request.env["omniauth.auth"]
    #   redirect_to new_user_path
    # end

    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = 'Logged in!'
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_path
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
