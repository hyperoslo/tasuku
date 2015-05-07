require 'spec_helper'

module Tasuku
  describe Taskables::Taskable do
    class Question

      # This is probably a bad idea, but otherwise Ruby will complain that there's
      # no 'has_one' method on my stub and I don't really care about that.
      class << self
        def method_missing *args; end
      end

      include Taskables::Taskable

      def answers
        ['foo', 'bar', 'baz']
      end

      responses are: :answers
    end

    describe '.submissions' do

      it 'aliases a given relation to responses' do
        expect(Question.new.responses).to eq ['foo', 'bar', 'baz']
      end

    end

    describe '#completed_by?' do
      let(:taskable) { create :verification }
      let(:user)     { create :user }
      let(:taskable_question) { create :question_with_options, options_count: 3, correct_option: 3 }

      context 'with an incomplete task' do
        it 'determines that the author has not completed it' do
          expect(taskable).not_to be_completed_by user
        end
      end

      context 'with a completed task' do
        before { create :verification_confirmation, author: user, verification: taskable }

        it 'determines that the author has completed it' do
          expect(taskable).to be_completed_by user
        end
      end

      context 'with a incorrectly answered question task' do
        before(:all) do
          ::Tasuku.configure do |config|
            config.update_answers = true
          end
        end
        before { create :question_answer, author: user, options: [taskable_question.options.first] }

        it 'determines that the author has not completed it' do
          expect(taskable_question).not_to be_completed_by user
        end
      end

      context 'with a correctly answered question task' do
        before { create :question_answer, author: user, options: [taskable_question.options.last] }

        it 'determines that the author has completed it' do
          expect(taskable_question).to be_completed_by user
        end
      end

    end
  end
end
