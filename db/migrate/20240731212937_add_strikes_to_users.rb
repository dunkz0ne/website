class AddStrikesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :strikes, :integer , default: 0, null: false
  end
end
