class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :part_number, :integer
  end
end
