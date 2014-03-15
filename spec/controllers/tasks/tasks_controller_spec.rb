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
  end
end
