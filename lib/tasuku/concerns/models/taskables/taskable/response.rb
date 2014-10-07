module Tasuku
  module Concerns::Models::Taskables::Taskable::Response
    extend ActiveSupport::Concern

    included do
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
end
