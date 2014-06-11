require 'spec_helper'
require 'views/tasuku/taskables/illustration_spec'

describe 'tasuku/taskables/url/requests/_request.html.erb' do
  let(:user) { create :user }

  context 'for url requests that have an image' do
    let(:url_request) { create :url_request, image: fixture("doge.jpg"), video_url: 'https://www.youtube.com/watch?v=z9Uz1icjwrM' }

    before do
      render partial: 'tasuku/taskables/url/requests/request.html.erb', locals: {
        request: url_request,
        current_author: user
      }
    end

    alias_method :request, :url_request
    it_behaves_like 'illustrations'
  end

  context 'for url requests that have no image' do
    let(:url_request) { create :url_request }

    before do
      render partial: 'tasuku/taskables/url/requests/request.html.erb', locals: {
        request: url_request,
        current_author: user
      }
    end

    alias_method :request, :url_request
    it_behaves_like 'no illustrations'
  end
end
