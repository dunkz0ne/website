# app/models/article.rb
class Article < ApplicationRecord
  belongs_to :journalist
  validates :title, presence: true
  validates :content, presence: true
end
