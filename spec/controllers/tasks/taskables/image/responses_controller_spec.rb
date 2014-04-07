require 'spec_helper'

module Tasks
  describe Taskables::Image::ResponsesController do
    routes { Tasks::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/image/requests/1/responses').to route_to(
          action: 'create',
          controller: 'tasks/taskables/image/responses',
          request_id: '1'
        )
      end

      context 'with a response' do
        let(:user)          { create :user }
        let(:image_request) { create :image_request }
        let(:params)        { { request_id: image_request.id, taskables_image_response: { image: fixture_file_upload('doge.jpg', 'image/jpg') } } }

        before { request.env['HTTP_REFERER'] = 'http://example.org' }
        before { expect(subject).to receive(:current_user).and_return(user) }

        it_behaves_like 'redirectable' do
          let(:action) { :create }
          let(:verb)   { :post }
        end

        it 'creates a new response' do
          post :create, params

          expect(image_request.responses.count).to eq 1
        end
      end
    end
  end
end
