class JournalistRequest < ApplicationRecord
  belongs_to :user
  has_one_attached :certificate

  validates :certificate, presence: true
end
