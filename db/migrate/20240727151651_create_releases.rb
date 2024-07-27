class CreateReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :releases do |t|
      t.string :title
      t.text :content
      t.integer :user_id, :null => false

      t.foreign_key :users, column: :user_id, primary_key: :id

      t.timestamps
    end
  end
end
