class Team < ApplicationRecord
  has_many :articles
  has_many :releases
end
