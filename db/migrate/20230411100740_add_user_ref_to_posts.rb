class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, column: :author_id, primary_key: :author_id
  end
end
