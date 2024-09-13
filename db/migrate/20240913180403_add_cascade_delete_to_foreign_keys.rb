class AddCascadeDeleteToForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :articles, :users
    remove_foreign_key :comments, :users
    remove_foreign_key :saves, :users
    remove_foreign_key :releases, :users
    remove_foreign_key :comments, :articles
    remove_foreign_key :save_comments, :users
    remove_foreign_key :banned_users, :users, column: :admin_id
    remove_foreign_key :journalist_requests, :users

    add_foreign_key :articles, :users, on_delete: :cascade
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :saves, :users, on_delete: :cascade
    add_foreign_key :releases, :users, on_delete: :cascade
    add_foreign_key :comments, :articles, on_delete: :cascade
    add_foreign_key :save_comments, :users, on_delete: :cascade
    add_foreign_key :banned_users, :users, column: :admin_id, on_delete: :cascade
    add_foreign_key :journalist_requests, :users, on_delete: :cascade
  end
end
