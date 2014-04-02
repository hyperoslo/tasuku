module Tasks::Concerns::Models::Task
  extend ActiveSupport::Concern

  included do
    belongs_to :taskable, polymorphic: true

    # TODO: These should be SQL. But that's hard.
    scope :completed_by,  ->(author) { all.select { |task| task.completed_by? author }}
    scope :incomplete_by, ->(author) { all.reject { |task| task.completed_by? author }}

    delegate :submissions, to: :taskable

    # Determine whether the task has been completed by the given author.
    #
    # author - Any model that can complete tasks.
    #
    # Returns a Boolean.
    def completed_by? author
      !!taskable.responses.find_by(author: author)
    end

    def to_s
      taskable.to_s
    end
  end
end
