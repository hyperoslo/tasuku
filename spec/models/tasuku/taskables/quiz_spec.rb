require 'spec_helper'
require 'pry'

module Tasuku
  describe Taskables::Quiz do
    let!(:user)     { create :user }
    let!(:quiz) { create :quiz_with_questions }

    it "has multiple questions" do
      expect(quiz.questions.count).to be(3)
    end

    context "if all questions are completed" do

      it "then is marked as completed" do
        quiz.questions.each do |question|
          answer = question.answers.build(author: user)
          answer.votes.new(option: question.options.first)
          answer.save
        end

        expect(quiz.completed_by?(user)).to be(true)

      end
    end

  end
end
