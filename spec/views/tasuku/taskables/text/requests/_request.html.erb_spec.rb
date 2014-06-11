require 'spec_helper'
require 'views/tasuku/taskables/illustration_spec'

describe 'tasuku/taskables/text/requests/_request.html.erb' do
  let(:user) { create :user }

  context 'for text requests that have an image' do
    let(:text_request) { create :text_request, image: fixture("doge.jpg"), video_url: 'https://www.youtube.com/watch?v=z9Uz1icjwrM' }

    before do
      render partial: 'tasuku/taskables/text/requests/request.html.erb', locals: {
        request: text_request,
        current_author: user
      }
    end

    alias_method :request, :text_request
    it_behaves_like 'illustrations'
  end

  context 'for text requests that have no image' do
    let(:text_request) { create :text_request }

    before do
      render partial: 'tasuku/taskables/text/requests/request.html.erb', locals: {
        request: text_request,
        current_author: user
      }
    end

    alias_method :request, :text_request
    it_behaves_like 'no illustrations'
  end
end
