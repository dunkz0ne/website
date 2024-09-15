class JournalistRequest < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :certificate, presence: true

  has_one_attached :certificate

  before_destroy :cleanup_certificate

  private

  def cleanup_certificate
    certificate.purge if certificate.attached?
  end
end
