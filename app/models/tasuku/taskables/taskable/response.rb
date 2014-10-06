module Tasuku
  class Taskables::Taskable::Response < ActiveRecord::Base
    self.table_name = 'tasuku_taskables_taskable_responses'

    belongs_to :author, polymorphic: true
    belongs_to :submittable, polymorphic: true
    belongs_to :task

    before_destroy :destroy_submittable

    def destroy_submittable
      submittable.destroy
    end
  end
end
