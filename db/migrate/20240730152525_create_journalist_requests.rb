class CreateJournalistRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :journalist_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :journalist_requests, :user_id, unique: true
  end
end
