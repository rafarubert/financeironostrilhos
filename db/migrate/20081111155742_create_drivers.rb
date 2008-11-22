class CreateDrivers < ActiveRecord::Migration
  def self.up
    create_table :drivers do |t|
      t.integer :driver_fixed_id
      t.float :value
      t.boolean :entry
      t.integer :account_id
      t.date :date_driver
      t.integer :category_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :drivers
  end
end
