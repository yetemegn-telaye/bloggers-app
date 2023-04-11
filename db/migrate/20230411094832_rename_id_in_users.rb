class RenameIdInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :id, :author_id
  end
end
