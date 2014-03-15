require 'spec_helper'

module Tasks
  describe TasksController do
    routes { Tasks::Engine.routes }

    describe "GET 'show'" do
      let(:task) { create :task }

      it "returns http success" do
        get 'show', id: task.id

        expect(response).to be_success
      end
    end

    describe "POST 'complete'" do
      let(:user) { create :user }

      before { request.env['HTTP_REFERER'] = 'http://example.org' }

      context 'with verification task' do
        let(:task) { create :verification_task }

        it "returns http success" do
          post 'complete', id: task.id, submission: {
            author_id: user.id,
            author_type: user.class.to_s
          }

          expect(response).to be_redirect
          expect(task.submissions.count).to eq 1

          submission = task.submissions.first

          expect(submission.author).to eq user
        end
      end
    end

  end
end
