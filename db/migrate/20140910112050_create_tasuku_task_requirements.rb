class CreateTasukuTaskRequirements < ActiveRecord::Migration
  def change
    create_table :tasuku_task_requirements do |t|
      t.integer :task_id, index: true
      t.integer :requirement_id, index: true

      t.timestamps
    end
  end
end
