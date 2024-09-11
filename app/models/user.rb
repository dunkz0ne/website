class User < ApplicationRecord

  # Validations
  validates :team_id, presence: true
  validate :team_must_exist
  validates :strikes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 3 }
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :password_strength_if_email_provider

  # Relationships
  has_one :team
  has_one_attached :photo
  has_many :articles, foreign_key: 'user_id'
  has_many :releases, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :saves, class_name: 'Save', foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :save_comments, foreign_key: 'user_id'
  has_many :banned_users, foreign_key: :user_email, primary_key: :email
  has_many :banned_users_as_admin, class_name: 'BannedUser', foreign_key: 'admin_id'
  has_secure_password

  # Set the inheritance column to type
  self.inheritance_column = :type

  # Check if a user exists with the given omniauth data
  def self.exists_with_omniauth?(auth_info)
      where(provider: auth_info.provider, id: auth_info.uid).exists?
  end

  # Check if a user exists with the given email
  def self.exists_with_email?(email)
    where(provider: 'email', email: email).exists?
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
        user.password_digest = SecureRandom.hex
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
    BannedUser.ban_user!(self, by_admin: by_admin, from: from, to: to, reason: reason)
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

    # Custom validation method
    def password_strength_if_email_provider
      if provider == 'email'
        if password.blank?
          errors.add(:password, "can't be blank")
        elsif password.length < 8
          errors.add(:password, "must be at least 8 characters long")
        elsif !password.match?(/(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/)
          errors.add(:password, "must contain a combination of letters, numbers, and special characters")
        end
      end
    end

end
