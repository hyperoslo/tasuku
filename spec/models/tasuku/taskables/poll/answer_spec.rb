require 'spec_helper'

module Tasuku
  describe Taskables::Poll::Answer do
    let(:user)     { create :user }

    describe '#poll' do
      let(:poll) { create :poll_with_options }
      let(:answer) { build :poll_answer, author: user, options: [poll.options.first] }

      it 'should derive the poll it is an answer to' do
        expect(answer.poll).to eq poll
      end
    end

    describe 'validations' do
      describe '#can_only_answer_each_poll_once' do
        let!(:poll)          { create :poll_with_options }
        let!(:answer)           { create :poll_answer, author: user, options: [poll.options.first] }
        let!(:duplicate_answer) { build :poll_answer, author: user, options: [poll.options.first] }

        it 'prohibits an author from answering the same poll more than once' do
          expect(duplicate_answer).not_to be_valid
        end

        it 'should have errors' do
          expect(duplicate_answer.errors_on(:base)).to eq [I18n.t('tasuku.taskables.polls.answers.already_answered')]
        end
      end

      describe '#can_only_vote_once_for_single_choice_polls' do
        let!(:poll) { create :poll_with_options, multiple: false }
        let!(:answer)   { build :poll_answer, author: user, options: [poll.options.first, poll.options.second] }

        it 'prohibits an author from answering the same poll more than once' do
          expect(answer).not_to be_valid
        end

        it 'should have errors' do
          expect(answer.errors_on(:base)).to eq [I18n.t('tasuku.taskables.polls.answers.can_only_vote_once')]
        end
      end
    end

    describe '#correct?' do
      it "always returns true" do
        answer = build :poll_answer
        expect(answer).to be_correct
      end
    end

    it_behaves_like "trackable submission" do
      let!(:task) {create(:poll_task)}
      let!(:subject) do
        create :poll_answer, author: user, options: [task.taskable.options.first]
      end
    end
  end
end
