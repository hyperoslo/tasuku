module Tasks
  module Taskables::Taskable::Submission
    extend ActiveSupport::Concern

    module ClassMethods
      # Declare the relation the submission belongs to.
      #
      # of - A String or Symbol describing the relation that instances of this model
      #      are submissions for.
      #
      # This method really only aliases the relation to 'request' so as to promote a
      # common interface for any submission.
      def submissions of: nil
        alias_method :request, of
      end
    end
  end
end
