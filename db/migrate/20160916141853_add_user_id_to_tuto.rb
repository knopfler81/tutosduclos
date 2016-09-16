class AddUserIdToTuto < ActiveRecord::Migration
  def change
    add_column :tutos, :user_id, :integer
  end
end
