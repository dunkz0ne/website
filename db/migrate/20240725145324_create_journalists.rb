class CreateJournalists < ActiveRecord::Migration[6.1]
  def change
    create_table :journalists do |t|
      t.string :type

      t.timestamps
    end
  end
end
