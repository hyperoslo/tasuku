module Tasuku
  module Concerns::Models::Requirables::Requirable
    extend ActiveSupport::Concern

    included do
      has_many :task_requirements
      has_many :requirements, through: :task_requirements
      has_many :inverse_tasks, class_name: "TaskRequirement", foreign_key: :requirement_id
      has_many :required_for, through: :inverse_tasks, source: :task

      accepts_nested_attributes_for :requirements, allow_destroy: true

      def locked? author
        return false if required_task_ids.empty?

        completed_task_ids_for(author).length != required_task_ids.length
      end

      def locked_by_tasks author
        completed_task_ids = Tasuku::Task.completed_by(author).pluck(:id) || []

        scope = requirements
        scope = scope.where.not(tasuku_task_requirements: {requirement_id: completed_task_ids}) unless completed_task_ids.empty?

        scope
      end

      def completed_task_ids_for author
        Tasuku::Task.completed_by(author).
          where(tasuku_taskables_taskable_responses: {task_id:required_task_ids})
      end

      def required_task_ids
        task_requirements.pluck :requirement_id
      end
    end
  end
end
