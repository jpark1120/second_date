class AddBadDateToFlags < ActiveRecord::Migration
  def change
    add_column :flags, :bad_date, :boolean, default: false
  end
end
