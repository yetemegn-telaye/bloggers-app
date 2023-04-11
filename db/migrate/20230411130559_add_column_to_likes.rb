class AddColumnToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :author_id, :bigint
  end
end
