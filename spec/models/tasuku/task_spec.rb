require 'spec_helper'

module Tasuku
  describe Task do
    describe "#completed_by" do
      let!(:user)     { create :user }
      let!(:task)     { create(:text_task) }
      let!(:subject) do
        create(:text_response, author: user, request: task.taskable)
      end

      it "returs completed tasks" do
        expect(Tasuku::Task.completed_by(user)).to eq([task])
      end
    end
  end
end
