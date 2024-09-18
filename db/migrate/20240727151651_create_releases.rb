class CreateReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :releases do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: { on_delete: :nullify } # Nullify the user_id in the article table when the user is deleted
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
