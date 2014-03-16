class CreateTasksTaskablesQuestions < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_questions do |t|
      t.text :text

      t.timestamps
    end
  end
end
