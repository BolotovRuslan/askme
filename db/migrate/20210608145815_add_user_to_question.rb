class AddUserToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :user, :reference
  end
end
