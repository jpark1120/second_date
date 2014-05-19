class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :spot_id
      t.integer :user_id
      t.text :opinion

      t.timestamps
    end
  end
end
