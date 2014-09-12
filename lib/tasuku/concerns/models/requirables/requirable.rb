module Tasuku
  module Concerns::Models::Requirables::Requirable
    extend ActiveSupport::Concern

    included do
      has_many :task_requirements
      has_many :requirements, through: :task_requirements
      has_many :invers_tasks, class_name: "TaskRequirement", foreign_key: :requirement_id
      has_many :required_for, through: :invers_tasks, source: :task

      accepts_nested_attributes_for :requirements, allow_destroy: true

      def locked? author
        required_task_ids = self.task_requirements.pluck :requirement_id
        return false if required_task_ids.empty?

        completed_task_ids = Tasuku::Task.completed_by(author).
          where('tasuku_taskables_taskable_responses.task_id IN (?)', required_task_ids)

        completed_task_ids.length.eql?(required_task_ids.length) ? false : true
      end

      def locked_by author
        completed_task_ids = Tasuku::Task.completed_by(author).pluck(:id) || []

        scope = self.requirements
        scope = scope.where(
          'tasuku_task_requirements.requirement_id NOT IN (?)', completed_task_ids
        ) unless completed_task_ids.empty?

        scope
      end
    end
  end
end
