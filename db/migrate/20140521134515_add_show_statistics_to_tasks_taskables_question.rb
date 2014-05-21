class AddShowStatisticsToTasksTaskablesQuestion < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_questions, :show_statistics, :boolean, default: true
  end
end
