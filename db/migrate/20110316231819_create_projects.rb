class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.integer :group_id
      t.integer :session_count
      t.text :description
      t.string :color
      t.integer :total_sessions_estimate
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
