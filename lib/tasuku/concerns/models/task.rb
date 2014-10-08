module Tasuku::Concerns::Models::Task
  extend ActiveSupport::Concern

  included do
    belongs_to :taskable, polymorphic: true
    has_many   :responses, class_name: '::Tasuku::Taskables::Taskable::Response'

    scope :completed_by,  ->(author) do
      joins(:responses).where(
        "tasuku_taskables_taskable_responses.author_id = ? and
         tasuku_taskables_taskable_responses.author_type = ?",
         author.id, author.class.name
      ).uniq
    end
    scope :incomplete_by, ->(author) { all.reject { |task| task.completed_by? author }}

    validates :taskable, presence: true

    delegate :completed_by?, :responses, to: :taskable

    def to_s
      taskable.to_s
    end
  end
end
