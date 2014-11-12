require 'spec_helper'

module Tasuku
  describe Taskables::Poll do
    let!(:user)     { create :user }
    let!(:poll) { create :poll_with_options }
    let!(:answer)   { create :poll_answer, author: user, options: [poll.options.first, poll.options.second] }

    describe '#answers' do
      let!(:other_poll) { create :poll_with_options }
      let!(:other_answer)   { create :poll_answer, author: user, options: [other_poll.options.first, other_poll.options.second] }

      it 'should derive its answers' do
        expect(poll.answers.count).to eq 1
      end
    end
  end
end
