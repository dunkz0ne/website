class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :draft
      t.references :user, null: false, foreign_key: { on_delete: :nullify } # Nullify the user_id in the article table when the user is deleted
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
