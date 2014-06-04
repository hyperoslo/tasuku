class AddObligatoryToTasksTask < ActiveRecord::Migration
  def change
    add_column :tasks_tasks, :obligatory, :boolean, null: false, default: false
  end
end
