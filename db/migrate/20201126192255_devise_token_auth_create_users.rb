class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text
  end
  add_index :users, [:uid, :provider], unique: true
end
