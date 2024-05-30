class User < ApplicationRecord
    has_one :team

    def self.from_omniauth(auth)
        user = where(id: auth.uid).first
        return user
        # user.update(
        #     name: auth.info.name,
        #     email: auth.info.email
        #     # oauth_token: auth.credentials.token,
        #     # oauth_expires_at: Time.at(auth.credentials.expires_at)
        # )
    end
end
