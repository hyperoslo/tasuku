require 'spec_helper'
require 'views/tasuku/taskables/illustration_spec'

describe 'tasuku/taskables/questions/_question.html.erb' do
  let(:user)     { create :user }

  context 'for questions that have an illustration' do
    let(:question) { create :question_with_options, image: fixture("doge.jpg"), video_url: 'https://www.youtube.com/watch?v=z9Uz1icjwrM' }

    before do
      render partial: 'tasuku/taskables/questions/question.html.erb', locals: {
        question: question,
        current_author: user
      }
    end

    alias_method :request, :question
    it_behaves_like 'illustrations'
  end

  context 'for questions that have no image' do
    let(:question) { create :question_with_options }

    before do
      render partial: 'tasuku/taskables/questions/question.html.erb', locals: {
        question: question,
        current_author: user
      }
    end

    alias_method :request, :question
    it_behaves_like 'no illustrations'
  end
end
