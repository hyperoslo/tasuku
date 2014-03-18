require 'spec_helper'

module Tasks
  describe Taskables::Taskable::Submission do
    class Answer
      include Taskables::Taskable::Submission

      def question
        'foo'
      end

      submissions of: :question
    end

    describe '.request' do

      it 'aliases a given relation to request' do
        expect(Answer.new.request).to eq 'foo'
      end

    end
  end
end
