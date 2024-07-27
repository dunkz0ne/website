class User < ApplicationRecord

  validates :team_id, presence: true
  validate :team_must_exist

  has_one :team
  has_many :articles, foreign_key: 'user_id'
  has_many :official_releases, foreign_key: 'user_id'

  self.inheritance_column = :type

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

  def become_journalist!
    self.update(type: 'Journalist')
  end


  private
  def team_must_exist
    unless Team.exists?(self.team_id)
      errors.add(:team_id, "must be a valid team ID")
    end
  end

end
