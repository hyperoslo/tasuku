class AddCorrectToTasksTaskablesQuestionOption < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_question_options, :correct, :boolean, default: false
  end
end
