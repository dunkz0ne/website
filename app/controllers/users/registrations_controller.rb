class Users::RegistrationsController < Devise::RegistrationsController

  def update
    successfully_updated = update_resource(resource, account_update_params)
    if successfully_updated
      sign_out(resource)
      redirect_to root_path, notice: 'La tua password è stata cambiata. Per favore, effettua nuovamente l\'accesso.'
    else
      render "edit"
    end
  end

  def complete_registration
    # Filter the parameters coming from the session
    auth_data = session["devise.facebook_data"]
    filtered_data = auth_data.slice("provider", "uid", "info", "credentials")

    # Create a new user with the filtered parameters
    @user = User.new(
      provider: filtered_data["provider"],
      id: filtered_data["uid"],
      email: filtered_data.dig("info", "email"),
      name: filtered_data.dig("info", "name")
    )
  end

  def finish_registration

    auth_info = session["devise.facebook_data"]
    team_id = user_params[:team_id]
    bio = user_params[:bio]
    photo = user_params[:photo]

    @user = User.find_or_create_from_omniauth(auth_info, team_id, bio, photo)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      render :complete_registration # Show the form again
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :team_id, :photo)
  end
end
