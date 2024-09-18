class BannedUser < ApplicationRecord
  belongs_to :user, foreign_key: :user_email, primary_key: :email

  validates :user_email, presence: true
  validates :banned_from, presence: true

  def self.cleanup_expired_bans
    Rails.logger.info "Starting cleanup of expired bans at #{Time.now}"
    expired_bans = where('banned_to < ?', Time.now)
    if expired_bans.none?
      Rails.logger.info "No expired bans to clean up."
      return
    end
    expired_bans.find_each(batch_size: 100) do |ban|
      @user = User.find_by(email: ban.user_email)
      if @user && @user.strikes == 3
        @user.reset_strikes_for_users_with_same_email(ban.user_email)
      end
    end
    # Destroy expired bans in one batch operation
    destroyed_count = expired_bans.destroy_all.count
    Rails.logger.info "Cleanup completed. Removed #{destroyed_count} expired bans."
  rescue => e
    Rails.logger.error "Error during ban cleanup: #{e.message}"
    raise
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
