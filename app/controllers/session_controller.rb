class SessionController < ApplicationController

  def new
    # Display the login form
  end

  def create
    if request.env['omniauth.auth'].nil? # Email/Password login
      name = params[:name]
      email = params[:email]
      password = params[:password]
      user = User.find_by(provider: 'email', email: email) # Search for user by email

      if user && user.authenticate(password) # User exists and password is correct, create session
        session[:user_id] = user.id
        session[:user_created] = true
        flash[:notice] = 'Logged in!'
        redirect_to user_dashboard_path
      else
        if name.nil? # Sign in flow
          flash[:alert] = 'Invalid password or account does not exist.'
          return redirect_to root_path
        else # Sign up flow
          handle_new_user_flow(name, email, password)
        end
      end
    else # Omniauth login
      handle_omniauth_login
    end
  end

  # Log out
  def destroy
    reset_session
    flash[:notice] = 'Logged out!'
    redirect_to root_path
  end

  # Fail oauth login
  def fail
    redirect_to root_path
  end

  private

  # Handle new user flow
  def handle_new_user_flow(name, email, password)
    if User.exists_with_email?(email)
      flash[:alert] = 'Invalid password or account does not exist.'
      render root_path
    else
      uid = Random.rand(1000000000) # Random id
      session[:user_id] = uid
      session[:auth_info] = {
        provider: 'email',
        uid: uid,
        name: name,
        email: email,
        password: password
      }
      redirect_to new_user_path, notice: 'Please complete sign-up.' # Redirect to form to complete sign-up
    end
  end

  # Handle omniauth login
  def handle_omniauth_login
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth.provider, id: auth.uid)

    if user
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
      redirect_to new_user_path, notice: 'Please complete sign-up.'
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:name, :email, :password)
    end
end
