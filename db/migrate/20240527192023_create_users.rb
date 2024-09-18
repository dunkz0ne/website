class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :team, null: false, foreign_key: true
      t.string :provider, null: false
      t.string :bio
      t.string :type
      t.integer :strikes, default: 0, null: false

      t.index :email, unique: true

      t.timestamps
    end
  end
end

