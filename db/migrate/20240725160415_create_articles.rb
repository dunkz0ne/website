class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :journalist_id, :null => false

      t.foreign_key :journalists, column: :journalist_id, primary_key: :id

      t.timestamps
    end
  end
end
