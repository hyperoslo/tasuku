class AddObligatoryToTasksTask < ActiveRecord::Migration
  def change
    add_column :tasks_tasks, :obligatory, :boolean, default: false
  end
end
