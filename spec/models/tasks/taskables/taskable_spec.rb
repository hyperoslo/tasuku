require 'spec_helper'

module Tasks
  describe Taskables::Taskable do
    class Question
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
  end
end
