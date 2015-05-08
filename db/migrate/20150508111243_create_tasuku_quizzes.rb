class CreateTasukuQuizzes < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_quizzes do |t|
      t.text :text
      t.text :description

      t.timestamps
    end
  end
end
