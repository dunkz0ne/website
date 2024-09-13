class Users::RegistrationsController < Devise::RegistrationsController

  # Update the user's password
  def update
    successfully_updated = update_resource(resource, account_update_params)
    if successfully_updated
      sign_out(resource)
      redirect_to root_path, notice: 'Your password has been updated. Please sign in again.'
    else
      render "edit"
    end
  end

  # Complete the registration
  def complete_registration
    facebook_data = session["devise.facebook_data"]
    google_data = session["devise.google_data"]

    if facebook_data.present?
      auth_data = facebook_data
    elsif google_data.present?
      auth_data = google_data
    else
      auth_data = nil
    end

    if auth_data
      filtered_data = auth_data.slice("provider", "uid", "info", "credentials")

      # Crea un nuovo utente con i dati OAuth
      @user = User.new(
        provider: filtered_data["provider"],
        id: filtered_data["uid"],
        email: filtered_data.dig("info", "email"),
        name: filtered_data.dig("info", "name")
      )
    else
      reset_session
      redirect_to root_path, alert: "Error during authentication"
    end
  end

  # Finish the registration after the form is submitted
  def finish_registration
    facebook_data = session["devise.facebook_data"]
    google_data = session["devise.google_data"]

    # Choose the provider to use
    auth_info = if facebook_data.nil?
                  google_data
                elsif google_data.nil?
                  facebook_data
                else
                  nil
                end

    # Data from the form
    team_id = user_params[:team_id]
    bio = user_params[:bio]
    photo = user_params[:photo]

    # Create the user with the OAuth data
    @user = User.find_or_create_from_omniauth(auth_info, team_id, bio, photo)

    if @user.persisted?
      # If the user is saved, sign in and redirect
      sign_in_and_redirect @user, event: :authentication and return
    else
      # If the user is not saved, render the form again
      redirect_to complete_registration_path, alert: 'Error during registration'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :team_id, :photo)
  end
end
