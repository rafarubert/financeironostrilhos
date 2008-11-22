class AddEntryFieldDriveFixed < ActiveRecord::Migration
  def self.up
      change_table :drive_fixeds do |t|
          t.boolean :entry, :default=>0
      end
  end

  def self.down
    change_table :drive_fixeds do |t|
          t.remove :entry
    end
  end
end
