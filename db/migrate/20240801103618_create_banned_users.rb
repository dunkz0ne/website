class CreateBannedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :banned_users do |t|
      t.string :user_email, null: false
      t.datetime :banned_from
      t.datetime :banned_to
      t.references :admin, null: false, foreign_key: { to_table: :users, on_delete: :nullify } # Nullify the admin_id in the banned_users table when the admin is deleted

      t.index :user_email, unique: true

      t.timestamps
    end
  end
end
