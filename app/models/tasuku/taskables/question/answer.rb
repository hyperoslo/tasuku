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
        votes.first.option.question if votes.any?
      end

      request is: :question

      def correct?
        return false if votes.empty?
        votes.all? { |vote| vote.option.correct? }
      end

      private

      def can_only_answer_each_question_once
        if !::Tasuku.config.update_answers
          false
        elsif question && question.answers.find_by(author: author)
          errors.add :base, I18n.t('tasuku.taskables.questions.answers.already_answered')
        end
      end

      def can_only_vote_once_for_single_choice_questions
        errors.add :base, I18n.t('tasuku.taskables.questions.answers.can_only_vote_once') if question && question.single? && votes.many?
      end
    end
  end
end
