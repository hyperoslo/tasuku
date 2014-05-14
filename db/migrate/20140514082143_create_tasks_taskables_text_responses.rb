class CreateTasksTaskablesTextResponses < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_text_responses do |t|
      t.text :text
      t.references :request
      t.references :author, polymorphic: true

      t.timestamps
    end

    add_index :tasks_taskables_text_responses, [:author_id, :author_type], unique: true, name: 'tasks_taskable_text_responses_author'
  end
end
