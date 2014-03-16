require 'spec_helper'

module Tasks
  describe Taskables::Taskable do
    class Question
      include Taskables::Taskable

      def answers
        ['foo', 'bar', 'baz']
      end

      submissions are: :answers
    end

    describe '.submissions' do

      it 'aliases a given relation to submissions' do
        expect(Question.new.submissions).to eq ['foo', 'bar', 'baz']
      end

    end
  end
end
