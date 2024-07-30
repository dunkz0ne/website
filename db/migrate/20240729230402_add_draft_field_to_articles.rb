class AddDraftFieldToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :draft, :bool
  end
end
