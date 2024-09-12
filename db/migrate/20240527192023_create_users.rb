class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email , :null => false # Delete this comment when we fix nil email
      t.integer :team_id, :null => false
      t.string :provider, :null => false

      t.foreign_key :teams, column: :team_id, primary_key: :id
      t.index :email, unique: true

      t.timestamps
    end
  end
end
