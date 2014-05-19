class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
    	t.integer :spot_id
    	t.integer :user_id
    	t.boolean :first_date, default: false
    	t.boolean :second_date, default: false
    	t.boolean :third_date, default: false

      t.timestamps
    end
  end
end
