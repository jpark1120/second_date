class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :rating
      t.integer :price
      t.string :hours

      t.timestamps
    end
  end
end
