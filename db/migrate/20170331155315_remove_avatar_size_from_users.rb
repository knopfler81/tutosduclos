class RemoveAvatarSizeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file_size
  end
end
