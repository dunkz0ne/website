class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :color
      t.integer :api

      t.timestamps
    end
  end
end
