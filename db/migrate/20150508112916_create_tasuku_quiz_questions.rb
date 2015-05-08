class CreateTasukuQuizQuestions < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_quiz_questions do |t|
      t.references :quiz, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
