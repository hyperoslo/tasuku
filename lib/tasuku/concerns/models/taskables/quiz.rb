module Tasuku
  module Concerns::Models::Taskables::Quiz
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      has_many :quiz_questions
      has_many :questions, through: :quiz_questions

      accepts_nested_attributes_for :questions, allow_destroy: true

      def completed_by?(author)
        if questions.present?
          questions.all? { |question| question.completed_by?(author) }
        end
      end

    end
  end
end
