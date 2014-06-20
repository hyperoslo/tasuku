class MigratePolymorphicRelations < ActiveRecord::Migration
  class Tasuku::Task < ActiveRecord::Base
    self.table_name = 'tasks_tasks'
  end

  def up
    Tasuku::Task.all.each do |task|
      task.taskable_type = task.taskable_type.gsub "Tasks::", "Tasuku::"
      task.save
    end
  end

  def down
    Tasuku::Task.all.each do |task|
      task.taskable_type = task.taskable_type.gsub "Tasuku::", "Tasks::"
      task.save
    end
  end
end
