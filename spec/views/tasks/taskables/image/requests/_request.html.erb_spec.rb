require 'spec_helper'

describe 'tasks/taskables/image/requests/_request.html.erb' do
  let(:user) { create :user }

  context 'for image requests that have an image' do
    let(:image_request) { create :image_request, image: fixture("doge.jpg") }

    before do
      render partial: 'tasks/taskables/image/requests/request.html.erb', locals: {
        request: image_request,
        current_author: user
      }
    end

    it 'renders the image' do
      expect(rendered).to have_xpath "//img[contains(@src, \"#{image_request.image.url}\")]"
    end
  end

  context 'for image requests that have no image' do
    let(:image_request) { create :image_request }

    before do
      render partial: 'tasks/taskables/image/requests/request.html.erb', locals: {
        request: image_request,
        current_author: user
      }
    end

    it 'does not renders an image' do
      expect(rendered).not_to have_xpath "//img"
    end
  end
end
