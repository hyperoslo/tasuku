class AddTaskToResponse < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_taskable_responses, :task_id, :integer
    add_index :tasks_taskables_taskable_responses, :task_id
  end
end
