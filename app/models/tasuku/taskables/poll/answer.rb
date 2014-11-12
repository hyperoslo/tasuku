module Tasuku
  module Taskables
    class Poll::Answer < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :author, polymorphic: true
      has_many :votes, dependent: :destroy

      validates :author_id, :author_type, presence: true
      validates :votes, length: { minimum: 1 }
      validate :can_only_answer_each_poll_once
      validate :can_only_vote_once_for_single_choice_polls

      def poll
        votes.first.option.poll if votes.any?
      end

      request is: :poll

      def correct?
        true
      end

      private

      def can_only_answer_each_poll_once
        errors.add :base, I18n.t('tasuku.taskables.polls.answers.already_answered') if poll && poll.answers.find_by(author: author)
      end

      def can_only_vote_once_for_single_choice_polls
        errors.add :base, I18n.t('tasuku.taskables.polls.answers.can_only_vote_once') if poll && poll.single? && votes.many?
      end
    end
  end
end
