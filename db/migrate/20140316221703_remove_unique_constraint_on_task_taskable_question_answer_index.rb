class RemoveUniqueConstraintOnTaskTaskableQuestionAnswerIndex < ActiveRecord::Migration
  def change
    remove_index :tasks_taskables_question_answers, name: 'tasks_taskable_question_answers_author'
    add_index :tasks_taskables_question_answers, [:author_id, :author_type], name: 'tasks_taskable_question_answers_author'
  end
end
