class User < ApplicationRecord
  has_one :team

  # Check if a user exists with the given omniauth data
  def self.exists_with_omniauth?(auth_info)
      where(provider: auth_info.provider, id: auth_info.uid).exists?
  end

  # Find or create a user with the given omniauth data
  def self.find_or_create_from_omniauth(auth_info, team_id)
      where(id: auth_info[:uid]).first_or_create do |user|
          user.provider = auth_info[:provider]
          user.id = auth_info[:uid]
          user.name = auth_info[:name]
          user.email = auth_info[:email]
          user.team_id = team_id
          user.save!
      end
  end
end
