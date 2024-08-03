class BannedUser < ApplicationRecord
  belongs_to :user, foreign_key: :user_email, primary_key: :email

  validates :user_email, presence: true
  validates :banned_from, presence: true

  def self.cleanup_expired_bans
    Rails.logger.info "Starting cleanup of expired bans at #{Time.now}"
    expired_bans = where('banned_to < ?', Time.now)
    expired_bans.each do |ban|
      user = ban.user
      reset_strikes_for_users_with_same_email(user.email)
    end
    expired_bans.destroy_all
  end

  def self.ban_user!(user, by_admin:, from: Time.now, to: nil, reason: '')
    raise "Only admins can ban users" unless by_admin.is_a?(Admin)

    create!(
      user_email: user.email,
      admin_id: by_admin.id,
      banned_from: from,
      banned_to: to
    )
  end
end
