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
  end
end
