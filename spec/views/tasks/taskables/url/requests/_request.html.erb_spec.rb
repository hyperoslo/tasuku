require 'spec_helper'

describe 'tasks/taskables/url/requests/_request.html.erb' do
  let(:user) { create :user }

  context 'for url requests that have an image' do
    let(:url_request) { create :url_request, image: fixture("doge.jpg") }

    before do
      render partial: 'tasks/taskables/url/requests/request.html.erb', locals: {
        request: url_request,
        current_author: user
      }
    end

    it 'renders the image' do
      expect(rendered).to have_xpath "//img[contains(@src, \"#{url_request.image.url}\")]"
    end
  end

  context 'for url requests that have no image' do
    let(:url_request) { create :url_request }

    before do
      render partial: 'tasks/taskables/url/requests/request.html.erb', locals: {
        request: url_request,
        current_author: user
      }
    end

    it 'does not renders an image' do
      expect(rendered).not_to have_xpath "//img"
    end
  end
end
