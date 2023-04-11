class RemoveColumnFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :address
  end
end
