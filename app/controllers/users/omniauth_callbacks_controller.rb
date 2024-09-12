class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_by(email: request.env["omniauth.auth"].info.email) # Search for user by email

    # User already exists
    if @user
      sign_in_and_redirect @user, event: :authentication # Craete session
    else
      # Save the data in the session so we can use it in the form
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to complete_registration_path, notice: 'Please complete sign-up.' # Redirect to form to complete sign-up
    end
  end

  # Handle the failure case
  def failure
    redirect_to root_path, alert: "Errore durante l'autenticazione tramite Facebook"
  end
end
