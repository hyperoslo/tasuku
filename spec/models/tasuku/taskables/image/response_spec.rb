require 'spec_helper'

module Tasuku
  describe Taskables::Image::Response do
    let(:user)     { create :user }
    let(:image) {fixture_file_upload('doge.jpg', 'image/jpeg')}

    it_behaves_like "trackable submission" do
      let!(:task) {create(:image_task)}
      let!(:subject) do
        create(:image_response, author: user, image: image, request: task.taskable)
      end
    end
  end
end
