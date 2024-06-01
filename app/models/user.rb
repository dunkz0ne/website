class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_one :team

    def self.from_omniauth(auth)
        where(id: auth.uid).first_or_create do |user|
        end
    end

end
