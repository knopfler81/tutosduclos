class AddDescriptionToTuto < ActiveRecord::Migration
  def change
    add_column :tutos, :description, :text
  end
end
