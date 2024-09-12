# app/models/article.rb
class Article < ApplicationRecord
  belongs_to :user
  belongs_to :team
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy

  has_one_attached :image
end
