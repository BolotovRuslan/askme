class AddIndexToTableUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true, length: 40
  end
end
