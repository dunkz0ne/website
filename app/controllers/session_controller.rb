class SessionController < ApplicationController

  def new
    # Display the login form
  end

  def create
    if request.env['omniauth.auth'].nil? # Email/Password login
      name = params[:name]
      email = params[:email]
      password = params[:password]
      user = User.find_by(email: email) # Search for user by email

      if user && user.provider != 'email' # User exists but is not an email user
        flash[:alert] = 'Account already exists with Facebook.'
        return redirect_to root_path
      elsif user && user.authenticate(password) # User exists and password is correct, create session
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
    redirect_to root_path, alert: 'Facebook login failed or was canceled.'
  end

  private

  # Handle new user flow
  def handle_new_user_flow(name, email, password)
    if User.exists_with_email?(email)
      flash[:alert] = 'Account does exist.'
      redirect_to session_new_path
    else
      uid = SecureRandom.uuid
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
    user = User.find_by(email: auth.info.email) # Search for user by email

    # Check for denied permissions or any other OmniAuth errors
    if request.env['omniauth.error'] || request.params['error'] == 'access_denied'
      redirect_to root_path, alert: 'Facebook login was canceled or an error occurred.'
    else
    # User exists, create session
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
        redirect_to new_user_path, notice: 'Please complete sign-up.' # Redirect to form to complete sign-up
      end
    end
  end


end
