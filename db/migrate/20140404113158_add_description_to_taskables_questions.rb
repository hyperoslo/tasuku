class AddDescriptionToTaskablesQuestions < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_questions, :description, :text
  end
end
