class CreateTasksTaskablesQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_question_answers do |t|
      t.references :option, index: true
      t.references :author, polymorphic: true

      t.timestamps
    end

    add_index :tasks_taskables_question_answers, [:author_id, :author_type], unique: true, name: 'tasks_taskable_question_answers_author'
  end
end
