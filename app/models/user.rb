class User < ApplicationRecord

  # Validations
  validates :team_id, presence: true
  validate :team_must_exist
  validates :strikes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 3 }

  # Relationships
  has_one :team
  has_one_attached :photo
  has_many :articles, foreign_key: 'user_id'
  has_many :releases, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :saves, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :save_comments, foreign_key: 'user_id'
  has_many :banned_users, foreign_key: 'user_id'
  has_many :banned_users_as_admin, class_name: 'BannedUser', foreign_key: 'admin_id'

  # Set the inheritance column to type
  self.inheritance_column = :type

  # Check if a user exists with the given omniauth data
  def self.exists_with_omniauth?(auth_info)
      where(provider: auth_info.provider, id: auth_info.uid).exists?
  end

  # Find or create a user with the given omniauth data
  def self.find_or_create_from_omniauth(auth_info, team_id, bio, photo)
    where(id: auth_info[:uid]).first_or_create do |user|
        user.provider = auth_info[:provider]
        user.id = auth_info[:uid]
        user.name = auth_info[:name]
        user.email = auth_info[:email]
        user.team_id = team_id
        user.bio = bio
        user.photo.attach(photo)
        user.save!
    end
  end

  def become_journalist!
    self.update(type: 'Journalist')
  end

  def become_team_manager!
    self.update(type: 'TeamManager')
  end

  def become_admin!
    self.update(type: 'Admin')
  end

  def ban!(by_admin:, from: Time.now, to: nil, reason: '')
    self.banned_users.create!(admin: by_admin, banned_from: from, banned_to: to)
  end

  def banned?
    banned_users.where('banned_from <= ? AND (banned_to IS NULL OR banned_to >= ?)', Time.now, Time.now).exists?
  end

  private

    # Method to validate the team ID
    def team_must_exist
      unless Team.exists?(self.team_id)
        errors.add(:team_id, "must be a valid team ID")
      end
    end

    # Method to ban a user if necessary
    def ban_if_necessary
      if strikes >= 3
        update(banned: true) # Ban the user
      end
    end

end
