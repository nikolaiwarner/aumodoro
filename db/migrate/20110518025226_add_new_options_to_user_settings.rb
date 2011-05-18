class AddNewOptionsToUserSettings < ActiveRecord::Migration
  def self.up
    add_column :users, :enable_sounds, :boolean
    add_column :users, :enable_desktop_notifications, :boolean
  end

  def self.down
    remove_column :users, :enable_sounds
    remove_column :users, :enable_desktop_notifications
  end
end
