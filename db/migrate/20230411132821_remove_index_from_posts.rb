class RemoveIndexFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_index :posts, name: "index_posts_on_address"
  end
end
