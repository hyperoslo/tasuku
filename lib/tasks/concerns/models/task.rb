module Tasks::Concerns::Models::Task
  extend ActiveSupport::Concern

  included do
    belongs_to :taskable, polymorphic: true

    delegate :submissions, to: :taskable

    # Determine whether the task has been completed by the given author.
    #
    # author - Any model that can complete tasks.
    #
    # Returns a Boolean.
    def completed_by? author
      !!taskable.submissions.find_by(author: author)
    end
  end
end
