module Tasuku
  module Concerns::Models::Taskables::Taskable::Response
    extend ActiveSupport::Concern

    included do
      self.table_name = 'tasuku_taskables_taskable_responses'

      belongs_to :author, polymorphic: true
      belongs_to :submittable, polymorphic: true
      belongs_to :task
    end
  end
end
