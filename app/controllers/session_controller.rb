class SessionController < ApplicationController

  def new
    # Visualizza il modulo di registrazione
  end

  def create
    if request.env['omniauth.auth'].nil?
      name = params[:name]
      email = params[:email]
      password = params[:password]
      user = User.exists_with_email?(email)
      if user
        if user&.authenticate(password)
          user = User.find_by(provider: 'email', email: email)
          session[:user_id] = user.id
          session[:user_created] = true
          flash[:notice] = 'Logged in!'
          redirect_to user_dashboard_path
        end
      else
        uid = Random.rand(1000000000)
        session[:user_id] = uid
        session[:auth_info] = {
          provider: 'email',
          uid: uid,
          name: name,
          email: email,
          password: password
        }
        redirect_to new_user_path
      end
    else

      auth = request.env['omniauth.auth']

      # Check if a user exists with the given omniauth data
      if User.exists_with_omniauth?(auth)
        user = User.find_by(provider: auth.provider, id: auth.uid)
        session[:user_id] = user.id
        session[:user_created] = true
        flash[:notice] = 'Logged in!'
        redirect_to user_dashboard_path
      else
        session[:user_id] = auth.uid
        session[:auth_info] = {
          provider: auth.provider,
          uid: auth.uid,
          name: auth.info.name,
          email: auth.info.email
        }
        redirect_to new_user_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:auth_info] = nil
    session[:user_created] = nil
    flash[:notice] = 'Logged out!'
    redirect_to root_path
  end

  def fail
    redirect_to root_path
  end
end
