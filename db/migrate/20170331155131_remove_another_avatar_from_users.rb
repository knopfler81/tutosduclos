class RemoveAnotherAvatarFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_updated_at
  end
end
