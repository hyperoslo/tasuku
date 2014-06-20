require 'spec_helper'

module Tasuku
  describe Taskables::Taskable::Submission do
    class Answer

      # This is probably a bad idea, but otherwise Ruby will complain that there's
      # no 'has_one' method on my stub and I don't really care about that.
      class << self
        def method_missing *args; end
      end

      include Taskables::Taskable::Submission

      def question
        'foo'
      end

      request is: :question
    end

    describe '.request' do

      it 'aliases a given relation to request' do
        expect(Answer.new.request).to eq 'foo'
      end

    end
  end
end
