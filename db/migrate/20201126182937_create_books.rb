class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :quantity
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, :title, unique: true
  end
end
