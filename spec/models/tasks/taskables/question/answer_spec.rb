require 'spec_helper'

module Tasks
  describe Taskables::Question::Answer do
    let(:user)     { create :user }

    describe '#question' do
      let(:question) { create :question_with_options }
      let(:answer) { build :question_answer, author: user, options: [question.options.first] }

      it 'should derive the question it is an answer to' do
        expect(answer.question).to eq question
      end
    end

    describe 'validations' do
      describe '#can_only_answer_each_question_once' do
        let!(:question)          { create :question_with_options }
        let!(:answer)           { create :question_answer, author: user, options: [question.options.first] }
        let!(:duplicate_answer) { build :question_answer, author: user, options: [question.options.first] }

        it 'prohibits an author from answering the same question more than once' do
          expect(duplicate_answer).not_to be_valid
        end

        it 'should have errors' do
          expect(duplicate_answer.errors_on(:base)).to eq [I18n.t('tasks.taskables.questions.answers.already_answered')]
        end
      end

      describe '#can_only_vote_once_for_single_choice_questions' do
        let!(:question) { create :question_with_options, multiple: false }
        let!(:answer)   { build :question_answer, author: user, options: [question.options.first, question.options.second] }

        it 'prohibits an author from answering the same question more than once' do
          expect(answer).not_to be_valid
        end

        it 'should have errors' do
          expect(answer.errors_on(:base)).to eq [I18n.t('tasks.taskables.questions.answers.can_only_vote_once')]
        end
      end
    end

    describe '#correct?' do
      let(:question) { create :question_with_options, multiple: true, options_count: 3 }
      let(:first_option) { question.options[0] }
      let(:second_option) { question.options[1] }

      context 'multiple correct options' do
        it 'should return true if all votes are correct' do
          first_option.update_attributes!(correct: true)
          second_option.update_attributes!(correct: true)
          answer = create :question_answer, options: [first_option, second_option]
          expect(answer).to be_correct
        end

        it 'should return false unless all votes are true' do
          first_option.update_attributes!(correct: true)
          answer = create :question_answer, options: [first_option, second_option]
          expect(answer).not_to be_correct
        end
      end
      context 'one correct option' do
        it 'should return true if all votes are correct' do
          first_option.update_attributes!(correct: true)
          answer = create :question_answer, options: [first_option]
          expect(answer).to be_correct
        end
        it 'should return false unless all votes are true' do
          first_option.update_attributes!(correct: true)
          answer = create :question_answer, options: [first_option, second_option]
          expect(answer).not_to be_correct
        end
      end
      context 'no correct options' do
        it 'should always return false' do
          answer = create :question_answer, options: [first_option]
          expect(answer).not_to be_correct
        end
      end
    end
  end
end
