class CreateDriveFixeds < ActiveRecord::Migration
  def self.up
    create_table :drive_fixeds do |t|
      t.integer :category_id
      t.integer :account_id
      t.string :title
      t.float :value
      t.integer :day_limit
      t.date :date_limit

      t.timestamps
    end
  end

  def self.down
    drop_table :drive_fixeds
  end
end
