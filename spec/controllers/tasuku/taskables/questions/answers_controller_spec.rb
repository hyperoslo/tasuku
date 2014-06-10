require 'spec_helper'

module Tasuku
  describe Taskables::Questions::AnswersController do
    routes { Tasuku::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/questions/1/answers').to route_to(
          action: 'create',
          controller: 'tasuku/taskables/questions/answers',
          question_id: '1'
        )
      end

      context 'with an answer' do
        let(:user)     { create :user }
        let(:question) { create :question }
        let(:option)   { create :question_option, question: question }
        let(:params)   { { question_id: question.id, taskables_question_answer: { option_ids: [option.id] } } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { expect(subject).to receive(:current_user).and_return(user) }

        it_behaves_like 'redirectable' do
          let(:action) { :create }
          let(:verb)   { :post }
        end

        it 'creates a new answer' do
          post :create, params

          expect(question.answers.count).to eq 1
        end
      end
    end

  end
end
