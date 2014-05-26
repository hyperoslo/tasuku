require 'spec_helper'

describe 'tasuku/taskables/text/requests/_request.html.erb' do
  let(:user) { create :user }

  context 'for text requests that have an image' do
    let(:text_request) { create :text_request, image: fixture("doge.jpg") }

    before do
      render partial: 'tasuku/taskables/text/requests/request.html.erb', locals: {
        request: text_request,
        current_author: user
      }
    end

    it 'renders the image' do
      expect(rendered).to have_xpath "//img[contains(@src, \"#{text_request.image.url}\")]"
    end
  end

  context 'for text requests that have no image' do
    let(:text_request) { create :text_request }

    before do
      render partial: 'tasuku/taskables/text/requests/request.html.erb', locals: {
        request: text_request,
        current_author: user
      }
    end

    it 'does not renders an image' do
      expect(rendered).not_to have_xpath "//img"
    end
  end
end
