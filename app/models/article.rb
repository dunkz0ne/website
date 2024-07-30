# app/models/article.rb
class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
end
