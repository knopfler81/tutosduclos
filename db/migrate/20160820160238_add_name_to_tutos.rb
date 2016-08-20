class AddNameToTutos < ActiveRecord::Migration
  def change
    add_column :tutos, :name ,:string
    add_column :tutos,  :content, :text
  end
end
