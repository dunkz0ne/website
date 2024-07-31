class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  has_many :likes, dependent: :destroy
  
  has_many :save_comments, dependent: :destroy

  validates :content, presence: true
end
