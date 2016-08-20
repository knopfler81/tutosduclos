class AddTitleAndContentToTutos < ActiveRecord::Migration
  def change
    add_column :tutos, :title, :string
    add_column :tutos, :content, :text
  end
end
