require 'spec_helper'

module Tasuku
  describe Taskables::Question do
    let!(:user)     { create :user }
    let!(:question) { create :question_with_options }
    let!(:answer)   { create :question_answer, author: user, options: [question.options.first, question.options.second] }

    describe '#answers' do
      let!(:other_question) { create :question_with_options }
      let!(:other_answer)   { create :question_answer, author: user, options: [other_question.options.first, other_question.options.second] }

      it 'should derive its answers' do
        expect(question.answers.count).to eq 1
      end
    end
  end
end
