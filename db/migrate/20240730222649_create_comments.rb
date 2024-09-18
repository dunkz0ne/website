class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :parent_id
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.index :parent_id

      t.timestamps
    end
  end
end
