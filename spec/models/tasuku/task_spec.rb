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

    describe "Requirements" do
      let!(:user)          { create :user }
      let!(:task)          { create(:task) }
      let!(:required_task) { create(:task) }

      context "with requirements for task" do
        let!(:requirement)   { create :task_requirement, task: task, requirement: required_task }

        context "without accomplished requirement" do
          describe "#locked?" do
            it "returns true" do
              expect(task.locked? user).to be_true
            end
          end

          describe "#locked_by" do
            it "returns list of tasks to acomplish" do
              expect(task.locked_by user).to eq([required_task])
            end
          end
        end

        context "with accomplished requirement" do
          let!(:response) { create :response, author: user, task: required_task }

          describe "#locked?" do
            it "returns false" do
              expect(task.locked? user).to be_false
            end
          end

          describe "#locked_by" do
            it "returns empty list" do
              expect(task.locked_by user).to be_empty
            end
          end
        end

      end
    end

  end
end
