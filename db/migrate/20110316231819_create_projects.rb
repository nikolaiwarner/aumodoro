class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.integer :group_id
      t.integer :pom_count
      t.text :description
      t.string :color
      t.float :default_pom_value
      t.integer :total_pom_estimate
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
