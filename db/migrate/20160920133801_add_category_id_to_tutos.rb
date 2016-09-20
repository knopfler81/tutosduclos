class AddCategoryIdToTutos < ActiveRecord::Migration
  def change
    add_column :tutos, :category_id, :integer
  end
end
