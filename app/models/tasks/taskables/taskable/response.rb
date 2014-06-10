module Tasks
  class Taskables::Taskable::Response < ActiveRecord::Base
    self.table_name = 'tasks_taskables_taskable_responses'

    belongs_to :author, polymorphic: true
    belongs_to :submittable, polymorphic: true
    belongs_to :task
  end
end
