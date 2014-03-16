require 'spec_helper'

describe 'tasks/taskables/questions/answers/_form.html.erb' do
  let(:user)     { create :user }
  let(:question) { create :question_with_options }

  before do
    render partial: 'tasks/taskables/questions/answers/form.html.erb', locals: {
      question: question
    }
  end

  it 'renders a radio button for each option' do
    question.options.each do |option|
      expect(rendered).to match option.text
    end
  end
end
