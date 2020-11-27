class AddIndexesOnFilterColumns < ActiveRecord::Migration[6.0]
  def change
  	add_index :loans, :is_active
  end
end
