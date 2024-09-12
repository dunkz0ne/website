class Admin < User
  has_many :banned_users_as_admin, class_name: 'BannedUser', foreign_key: 'admin_id'
end
