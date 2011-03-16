class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.datetime :datetime
      t.bool :success
      t.integer :user_id
      t.integer :project_id
      t.text :description
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
