class AddUserIdToTuto < ActiveRecord::Migration
  def change
    add_column :tutos, :user_id, :integer
    add_index  :tutos, :user_id
  end
end
