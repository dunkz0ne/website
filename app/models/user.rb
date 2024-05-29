class User < ApplicationRecord
    has_one :team

    def self.from_omniauth(auth)
        where(id: auth.uid).first_or_create do |user|
            user.id = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
            # user.oauth_token = auth.credentials.token
            # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            # user.save!
        end
    end
end
