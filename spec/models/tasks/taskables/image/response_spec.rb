require 'spec_helper'

module Tasks
  describe Taskables::Image::Response do
    let(:user)     { create :user }
    let(:image) {fixture_file_upload('doge.jpg', 'image/jpeg')}

    it_behaves_like "trackable submission" do
      let!(:subject) {create(:tasks_taskables_image_response, author: user, image: image)}
    end
  end
end
