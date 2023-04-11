class AddAuthorIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :author_index, :string
    add_index :users, :author_index
  end
end
