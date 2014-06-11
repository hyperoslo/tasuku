require 'spec_helper'
require 'views/tasuku/taskables/illustration_spec'

describe 'tasuku/taskables/image/requests/_request.html.erb' do
  let(:user) { create :user }

  context 'for image requests that have an image' do
    let(:image_request) { create :image_request, image: fixture("doge.jpg"), video_url: 'https://www.youtube.com/watch?v=z9Uz1icjwrM' }

    before do
      render partial: 'tasuku/taskables/image/requests/request.html.erb', locals: {
        request: image_request,
        current_author: user
      }
    end

    alias_method :request, :image_request
    it_behaves_like 'illustrations'
  end

  context 'for image requests that have no image' do
    let(:image_request) { create :image_request }

    before do
      render partial: 'tasuku/taskables/image/requests/request.html.erb', locals: {
        request: image_request,
        current_author: user
      }
    end

    alias_method :request, :image_request
    it_behaves_like 'no illustrations'
  end
end
