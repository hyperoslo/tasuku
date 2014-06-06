class MigratePolymorphicRelations < ActiveRecord::Migration
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
