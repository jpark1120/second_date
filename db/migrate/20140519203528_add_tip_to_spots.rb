class AddTipToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :tip, :string
  end
end
