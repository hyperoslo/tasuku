require 'spec_helper'

module Tasuku
  describe Task do
    let(:task) { create :tasuku_task, :with_verification }
    let(:user) { create :user }

    describe '#completed_by?' do
      context 'with an incomplete task' do
        it 'determines that the author has not completed it' do
          expect(task).not_to be_completed_by user
        end
      end

      context 'with a completed task' do
        before { create :verification_confirmation, author: user, verification: task.taskable }

        it 'determines that the author has completed it' do
          expect(task).to be_completed_by user
        end
      end
    end
  end
end
