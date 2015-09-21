module Tasuku
  module Concerns::Models::Taskables::QuizQuestion
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      belongs_to :quiz
      belongs_to :question

    end
  end
end
