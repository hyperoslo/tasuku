require 'spec_helper'

module Tasuku
  describe Concerns::Author do
    let!(:user)         { create :user }
    let!(:article)      { create :article }
    let!(:task)         { create :task }
    let!(:verification) { create :verification, task: task, verifiable: article }
    let!(:confirmation) { create :verification_confirmation, author: user, verification: verification }
    let!(:response)     { Taskables::Taskable::Response.find_by author: user, submittable: confirmation }

    describe 'dependencies' do
      before { user.destroy }

      it 'destroys its responses' do
        expect { response.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
