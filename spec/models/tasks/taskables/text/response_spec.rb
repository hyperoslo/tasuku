require 'spec_helper'

module Tasks
  describe Taskables::Text::Response do
    let(:user)     { create :user }

    it_behaves_like "trackable submission" do
      let!(:subject) { create :tasks_taskables_text_response, author: user }
    end
  end
end
