class RemoveForeignKeyFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :users
  end
end
