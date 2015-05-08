module Tasuku
  module Taskables::Taskable
    extend ActiveSupport::Concern

    # Determine whether the task has been completed by the given author.
    #
    # author - Any model that can complete tasks.
    #
    # Returns a Boolean.
    def completed_by? author
      response = responses.find_by(author: author)
      if ::Tasuku.config.update_answers && response && response.is_a?(::Tasuku::Taskables::Question::Answer)
        response.correct?
      else
        !!response
      end
    end

    included do
      has_one :task, as: :taskable, class_name: '::Tasuku::Task', dependent: :destroy
    end

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
