require 'spec_helper'

module Tasuku
  describe Taskables::Text::ResponsesController do
    routes { Tasuku::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/taskables/text/requests/1/responses').to route_to(
          action: 'create',
          controller: 'tasuku/taskables/text/responses',
          request_id: '1'
        )
      end

      context 'with a response' do
        let(:user)          { create :user }
        let(:text_request) { create :text_request }
        let(:params)        { { request_id: text_request.id, taskables_text_response: { text: 'Yes hello this is dog?' } } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { expect(subject).to receive(:current_user).and_return(user) }

        it_behaves_like 'redirectable' do
          let(:action) { :create }
          let(:verb)   { :post }
        end

        it 'creates a new response' do
          post :create, params

          expect(text_request.responses.count).to eq 1
        end
      end
    end
  end
end
