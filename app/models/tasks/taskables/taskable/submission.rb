module Tasks
  module Taskables::Taskable::Submission
    extend ActiveSupport::Concern

    module ClassMethods
      # Declare the relation the response belongs to.
      #
      # is - A String or Symbol describing the relation that instances of this model
      #      are responses for.
      #
      # This method really only aliases the relation to 'request' so as to promote a
      # common interface for any submission.
      def request is: nil
        alias_method :request, is
      end
    end
  end
end
