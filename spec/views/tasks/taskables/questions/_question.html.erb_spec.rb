require 'spec_helper'

describe 'tasks/taskables/questions/_question.html.erb' do
  let(:user)     { create :user }

  context 'for questions that have an image' do
    let(:question) { create :question_with_options, image: fixture("doge.jpg") }

    before do
      render partial: 'tasks/taskables/questions/question.html.erb', locals: {
        question: question,
        current_author: user
      }
    end

    it 'renders the image' do
      expect(rendered).to have_xpath "//img[contains(@src, \"#{question.image.url}\")]"
    end
  end

  context 'for questions that have no image' do
    let(:question) { create :question_with_options }

    before do
      render partial: 'tasks/taskables/questions/question.html.erb', locals: {
        question: question,
        current_author: user
      }
    end

    it 'does not renders an image' do
      expect(rendered).not_to have_xpath "//img"
    end
  end
end
