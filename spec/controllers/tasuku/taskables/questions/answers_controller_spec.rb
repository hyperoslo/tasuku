require 'spec_helper'

module Tasuku
  describe Taskables::Questions::AnswersController do
    routes { Tasuku::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/taskables/questions/1/answers').to route_to(
          action: 'create',
          controller: 'tasuku/taskables/questions/answers',
          question_id: '1'
        )
      end

      context 'with an answer' do
        let(:user)     { create :user }
        let(:question) { create :question_with_options }
        let(:option)   { create :question_option, question: question }
        let(:params)   { { question_id: question.id, taskables_question_answer: { option_ids: [option.id] } } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { allow(subject).to receive(:current_user).and_return(user) }

        it_behaves_like 'redirectable' do
          let(:action) { :create }
          let(:verb)   { :post }
        end

        it 'creates a new answer' do
          post :create, params

          expect(question.answers.count).to eq 1
        end
      end

      context 'no answers' do
        let(:user)     { create :user }
        let(:question) { create :question }
        let(:params)   { { question_id: question.id } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { post :create, params }

        it 'does not create a new answer' do
          expect(question.answers.count).to be_zero
        end

        it 'redirects back' do
          expect(response).to redirect_to 'http://example.org'
        end

        it 'renders an alert' do
          expect(flash[:alert]).to eq I18n.t('tasuku.taskables.questions.answers.no_answers')
        end
      end
    end

    describe "PUT 'update'" do
      it 'routes' do
        expect(put: '/taskables/questions/1/answers/1').to route_to(
          action: 'update',
          controller: 'tasuku/taskables/questions/answers',
          question_id: '1',
          id: '1'
        )
      end

      context 'with an answer' do
        let(:user)     { create :user }
        let(:question) { create :question_with_options }
        let(:option)   { create :question_option, question: question }

        let(:vote) { create :question_vote, option: question.options.first }
        let(:question_answer) { create :question_answer, author: user, votes: [vote] }

        let(:new_vote) { create :question_vote, option: question.options.last }
        let(:params) { { question_id: question.id, id: question_answer.id, taskables_question_answer: { option_ids: [new_vote.id] }  } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { allow(subject).to receive(:current_user).and_return(user) }

        it_behaves_like 'redirectable' do
          let(:action) { :update }
          let(:verb)   { :put }
        end

        it 'updates a existing answer' do
          expect(subject).to receive(:redirect_path_for).with(kind_of(Tasuku::Taskables::Question::Answer)).and_return :back

          put :update, params
          question_answer.reload

          expect(response).to redirect_to(:back)
          expect(question_answer.votes.first.option_id).to eq(new_vote.id)
        end

      end
    end

  end
end
