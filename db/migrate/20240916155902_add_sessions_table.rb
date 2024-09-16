class AddSessionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :session_id, null: false
      t.text :data
      t.datetime :expires_at

      t.timestamps
    end

    add_index :sessions, :session_id, unique: true
    add_index :sessions, :expires_at
  end
end

