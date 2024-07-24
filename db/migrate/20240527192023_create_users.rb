class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, not_null: false
      t.string :email, not_null: false
      t.integer :team_id, not_null: false
      t.string :provider

      t.timestamps
    end
  end
end
