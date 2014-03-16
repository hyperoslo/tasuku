require 'spec_helper'

module Tasks
  describe Taskables::Question::Answer do
    describe 'validations' do
      describe '#can_only_answer_each_question_once' do
        let(:user)      { create :user }
        let(:question)  { create :question_with_options }
        let(:duplicate) { build :question_answer, option: question.options.first, question: question, author: user }

        before do
          create :question_answer, option: question.options.first, question: question, author: user
        end

        it 'prohibits an author from answering the same question more than once' do
          expect(duplicate).not_to be_valid
        end

        it 'should have errors' do
          expect(duplicate.errors_on(:base)).to include I18n.t('tasks.taskables.questions.answers.already_answered')
        end
      end
    end
  end
end
