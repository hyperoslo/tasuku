require 'spec_helper'

module Tasuku
  describe Taskables::Text::Response do
    let(:user)     { create :user }

    it_behaves_like "trackable submission" do
      let!(:task) { create(:text_task) }
      let!(:subject) do
        create(:text_response, author: user, request: task.taskable)
      end
    end
  end
end
