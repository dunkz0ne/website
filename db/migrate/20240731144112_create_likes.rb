class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :comment
      t.references :user

      t.timestamps
    end
  end
end
