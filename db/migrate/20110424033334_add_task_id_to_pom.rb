class AddTaskIdToPom < ActiveRecord::Migration
  def self.up
    add_column :poms, :task_id, :integer
  end

  def self.down
    remove_column :poms, :task_id
  end
end
