require 'spec_helper'

module Tasks
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
    end
  end
end
