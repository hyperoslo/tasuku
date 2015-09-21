require 'spec_helper'

module Tasuku
  describe Taskables::Code::ResponsesController do
    routes { Tasuku::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/taskables/code/requests/1/responses').to route_to(
          action: 'create',
          controller: 'tasuku/taskables/code/responses',
          request_id: '1'
        )
      end

      context 'with a response' do
        let(:user)          { create :user }
        let(:code_request)  { create :code_request, code: '1337' }
        let(:params)        { { request_id: code_request.id, taskables_code_response: { code: '1337' } } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { expect(subject).to receive(:current_user).and_return(user) }

        it_behaves_like 'redirectable' do
          let(:action) { :create }
          let(:verb)   { :post }
        end

        it 'creates a new response' do
          post :create, params

          expect(code_request.responses.count).to eq 1
          expect(code_request.responses.first.code).to eq '1337'
        end
      end
    end
  end
end
