module Tasuku
  module Taskables
    class Question::Answer < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :author, polymorphic: true
      has_many :votes, dependent: :destroy

      validates :author_id, :author_type, presence: true
      validates :votes, length: { minimum: 1 }
      validate :can_only_answer_each_question_once
      validate :can_only_vote_once_for_single_choice_questions

      def question
        if votes.any?
          votes.first.option.question
        else
          raise StandardError, "Cannot derive question for #{self}, as it has no votes"
        end
      end

      request is: :question

      def correct?
        votes.all? { |vote| vote.option.correct? }
      end

      private

      def can_only_answer_each_question_once
        errors.add :base, I18n.t('tasuku.taskables.questions.answers.already_answered') if question.answers.find_by author: author
      end

      def can_only_vote_once_for_single_choice_questions
        errors.add :base, I18n.t('tasuku.taskables.questions.answers.can_only_vote_once') if question.single? && votes.many?
      end
    end
  end
end
