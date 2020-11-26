class AddIsLibrarianToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_librarian, :boolean, null: false, default: false
  end
end
