class CreateTasksTaskablesQuestionOptions < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_question_options do |t|
      t.text :text
      t.references :question, index: true

      t.timestamps
    end
  end
end
