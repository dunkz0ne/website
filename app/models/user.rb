class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  # Validations
  validates :team_id, presence: true
  validates :strikes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 3 }
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

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

  before_destroy :purge_photo

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
    where(email: auth_info.info[:email]).first_or_create do |user|
        user.provider = auth_info[:provider]
        user.id = auth_info.info[:uid]
        user.name = auth_info.info[:name]
        user.email = auth_info.info[:email]
        user.team_id = team_id
        user.bio = bio
        user.photo.attach(photo)
        user.password = Devise.friendly_token[0, 20]
        user.save!
    end
  end

  # Method to ban a user for 60 seconds
  def ban!(by_admin:, from: Time.now, to: nil, reason: '')
    # For testing
    to ||= from + 60.seconds
    banned_user = BannedUser.find_by(user_email: self.email)

    if banned_user
      banned_user.update(banned_to: to)
    else
      BannedUser.ban_user!(self, by_admin: by_admin, from: from, to: to, reason: reason)
    end
  end

  # Method to check if a user is banned
  def banned?
    banned_users.where('banned_from <= ? AND (banned_to IS NULL OR banned_to >= ?)', Time.now, Time.now).exists?
  end

  # Method to reset the strikes of users with the same email
  def reset_strikes_for_users_with_same_email(email)
    Rails.logger.info "Starting cleanup of strikes"
    users_with_same_email = User.where(email: email)
    users_with_same_email.update_all(strikes: 0)
  end

  # Debug methods

  def become_journalist!
    self.update(type: 'Journalist')
  end

  def become_team_manager!
    self.update(type: 'TeamManager')
  end

  def become_admin!
    self.update(type: 'Admin')
  end

  private

  def purge_photo
    photo.purge_later if photo.attached?
  end
end
