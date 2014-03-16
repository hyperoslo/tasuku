require 'spec_helper'

module Tasks
  describe Taskables::Questions::AnswersController do
    routes { Tasks::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/questions/1/answers').to route_to(
          action: 'create',
          controller: 'tasks/taskables/questions/answers',
          question_id: '1'
        )
      end

      context 'with an answer' do
        let(:user)     { create :user }
        let(:question) { create :question }
        let(:option)   { create :question_option, question: question }

        before do
          request.env['HTTP_REFERER'] = 'http://example.org'

          post :create, question_id: question.id, taskables_question_answer: {
            author_type: user.class.name,
            author_id: user.id,
            option_id: option.id
          }
        end

        it 'should redirect' do
          expect(response).to be_redirect
        end

        it 'creates a new answer' do
          expect(question.answers.count).to eq 1
        end
      end
    end

  end
end
