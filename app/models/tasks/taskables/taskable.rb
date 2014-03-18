module Tasks
  module Taskables::Taskable
    extend ActiveSupport::Concern

    delegate :completed_by?, to: :task

    module ClassMethods
      # Declare the relation for responses.
      #
      # are - A model that represents submissions.
      #
      # This method really only aliases the name of the taskable's join model
      # between authors and tasks to 'responses' so as to promote a common interface
      # for any taskable.
      def responses are: nil
        alias_method :responses, are
      end
    end
  end
end
