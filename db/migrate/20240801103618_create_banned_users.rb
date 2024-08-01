class CreateBannedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :banned_users do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :banned_from
      t.datetime :banned_to

      t.timestamps
    end
  end
end
