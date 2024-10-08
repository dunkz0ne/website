class CreateJournalistRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :journalist_requests do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
