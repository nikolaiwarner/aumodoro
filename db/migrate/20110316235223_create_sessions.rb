class CreatePoms < ActiveRecord::Migration
  def self.up
    create_table :poms do |t|
      t.datetime :datetime
      t.boolean :success
      t.integer :user_id
      t.integer :project_id
      t.text :description
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :poms
  end
end
