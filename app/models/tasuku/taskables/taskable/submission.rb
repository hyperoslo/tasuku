module Tasuku
  module Taskables::Taskable::Submission
    extend ActiveSupport::Concern

    included do
      scope :by, ->(author) { where author: author }

      after_create do |model|
        if model.request.task.present?
          Tasks::Taskables::Taskable::Response.create do |response|
            response.author = model.author
            response.submittable = model
            response.task = model.request.task
          end
        end
      end

      before_destroy do |model|
        Tasks::Taskables::Taskable::Response.where(
          "submittable_id = ? and submittable_type = ? and author_id = ? and author_type = ?", 
          model.id, model.class.name, model.author.id, model.author.class.name
        ).delete_all
      end
    end

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
