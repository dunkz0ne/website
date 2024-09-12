class Release < ApplicationRecord
  belongs_to :user
  belongs_to :team
  validates :title, presence: true
  validates :content, presence: true

  has_one_attached :image
end
