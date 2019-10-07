class CreateOeders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.integer :part_id
      t.integer :user_id    
    end
  end
end
