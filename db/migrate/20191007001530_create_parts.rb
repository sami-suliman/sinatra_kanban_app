class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :number
      t.string :name
      t.string :boom_location
      t.string :kingo_location     
    end
  end
end
