module Tasks
  module Taskables::Taskable
    extend ActiveSupport::Concern

    delegate :completed_by?, to: :task

    module ClassMethods
      # Declare the relation for submissions.
      #
      # are - A model that represents submissions.
      #
      # This method really only aliases the name of the taskable's join model
      # between authors and tasks to 'submissions' so as to promote a common interface
      # for any taskable.
      def submissions are: nil
        alias_method :submissions, are
      end
    end
  end
end
