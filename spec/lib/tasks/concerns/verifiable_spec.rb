require 'spec_helper'

module Tasks
  describe Concerns::Verifiable do
    let!(:user)         { create :user }
    let!(:article)      { create :article }
    let!(:task)         { create :task }
    let!(:verification) { create :verification, task: task, verifiable: article }
    let!(:confirmation) { create :verification_confirmation, author: user, verification: verification }

    it 'has a verification' do
      expect(article.verification).to eq verification
    end

    it 'has a task' do
      expect(article.task).to eq task
    end

    it 'has many confirmations' do
      expect(article.confirmations).to eq [confirmation]
    end
  end
end
