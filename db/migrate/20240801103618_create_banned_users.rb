class CreateBannedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :banned_users do |t|
      t.string :user_email, null: false
      t.datetime :banned_from
      t.datetime :banned_to

      t.timestamps
    end

    add_index :banned_users, :user_email, unique: true
  end
end
