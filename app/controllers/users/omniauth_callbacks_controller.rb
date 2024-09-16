class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_by(email: request.env["omniauth.auth"].info.email) # Search for user by email

    # User already exists
    if @user
      sign_in_and_redirect @user, event: :authentication # Craete session
    else
      # Save the data in the session so we can use it in the form
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      if session["devise.facebook_data"].info.email.blank?
        redirect_to new_user_registration_path, Alert: 'Check your Facebook privacy settings and allow email sharing.'
      else
        redirect_to complete_registration_path, notice: 'Please complete sign-up.'
      end
    end
  end

  def google_oauth2
    @user = User.find_by(email: request.env["omniauth.auth"].info.email) # Search for user by email

    # User already exists
    if @user
      sign_in_and_redirect @user, event: :authentication # Craete session
    else
      # Save the data in the session so we can use it in the form
      session["devise.google_data"] = request.env["omniauth.auth"]
      if session["devise.google_data"].info.email.blank?
        redirect_to new_user_registration_path, Alert: 'Check your Google privacy settings and allow email sharing.'
      else
        redirect_to complete_registration_path, notice: 'Please complete sign-up.'
      end
    end
  end

  # Handle the failure case
  def failure
    redirect_to root_path, alert: "Error during authentication"
  end
end

# OAuth2 Google

# credentials: Contains the credentials obtained from Google, including:
  # token: The OAuth2 access token.
  # refresh_token: The token used to request a new access once the current token expires.
  # expires_at: The UNIX timestamp indicating when the token will expire.
  # scope: The authorization scopes obtained by the app.

# info: This is a sub-hash containing user information, including:
  # email: The user's verified email address.
  # email_verified: Whether the email is verified.
  # first_name: The user's first name.
  # last_name: The user's last name.
  # name: The user's full name.
  # image: The URL of the user's profile image.

# provider: The identifier of the OAuth provider.
# uid: The user's unique ID on Google.


# OAuth2 Facebook

# credentials: Contains the OAuth credentials received from Facebook:
  # token: The Facebook OAuth access token, which can be used to make API requests.
  # expires_at: The UNIX timestamp indicating when the token will expire.
  # expires: Indicates whether the token has an expiration date (in this case, it is true).

# info: Contains the main user information from Facebook:
  # email: The email address associated with the user's Facebook account.
  # name: The user's full name on Facebook.
  # image: The URL of the Facebook profile image.
  # provider: Indicates the provider used for authentication.

# uid: The user's unique ID on Facebook.
