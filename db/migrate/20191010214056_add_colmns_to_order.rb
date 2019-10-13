class AddColmnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :qty, :integer
    add_column :orders, :picked, :boolean, default:  false
  end
end
