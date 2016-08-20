class CreateTutos < ActiveRecord::Migration
  def change
    create_table :tutos do |t|

      t.timestamps null: false
    end
  end
end
