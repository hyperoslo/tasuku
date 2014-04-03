class CreateTasksTaskablesImageResponses < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_image_responses do |t|
      t.string :image
      t.references :request, index: true
      t.references :author, polymorphic: true

      t.timestamps
    end

    add_index :tasks_taskables_image_responses, [:author_id, :author_type], unique: true, name: 'tasks_taskable_image_responses_author'
  end
end
