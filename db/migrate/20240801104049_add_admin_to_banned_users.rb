class AddAdminToBannedUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :banned_users, :admin, null: false, foreign_key: { to_table: :users }
  end
end
