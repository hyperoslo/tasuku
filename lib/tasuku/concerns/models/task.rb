module Tasuku::Concerns::Models::Task
  extend ActiveSupport::Concern

  included do
    belongs_to :taskable, polymorphic: true

    # TODO: These should be SQL. But that's hard.
    scope :completed_by,  ->(author) { all.select { |task| task.completed_by? author }}
    scope :incomplete_by, ->(author) { all.reject { |task| task.completed_by? author }}

    validates :taskable, presence: true

    delegate :completed_by?, :submissions, to: :taskable

    def to_s
      taskable.to_s
    end
  end
end
