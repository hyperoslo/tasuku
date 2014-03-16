require 'spec_helper'

module Tasks
  describe Taskables::Verifications::ConfirmationsController do
    routes { Tasks::Engine.routes }

    describe "POST 'create'" do
      it 'routes' do
        expect(post: '/verifications/1/confirmations').to route_to(
          action: 'create',
          controller: 'tasks/taskables/verifications/confirmations',
          verification_id: '1'
        )
      end

      context 'with a confirmation' do
        let(:user)         { create :user }
        let(:verification) { create :verification }

        before do
          request.env['HTTP_REFERER'] = 'http://example.org'

          expect(subject).to receive(:current_user).and_return(user)

          post :create, verification_id: verification.id
        end

        it 'should redirect' do
          expect(response).to be_redirect
        end

        it 'creates a new confirmation' do
          expect(verification.confirmations.count).to eq 1
        end
      end
    end

  end
end
