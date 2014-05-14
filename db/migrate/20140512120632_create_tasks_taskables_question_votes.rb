class CreateTasksTaskablesQuestionVotes < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_question_votes do |t|
      t.references :answer, index: true
      t.references :option, index: true

      t.timestamps
    end
  end
end
