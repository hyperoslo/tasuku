require 'spec_helper'

module Tasks
  describe Taskables::VerificationsHelper do
    describe '#confirm' do
      let(:user)         { create :user }
      let(:verification) { create :verification }

      it 'renders a partial' do
        expect(helper).to receive(:render).with(
          partial: 'tasks/taskables/verifications/confirmations/form.html.erb', locals: {
            confirmation: an_instance_of(Taskables::Verification::Confirmation),
            author: user
          }
        )

        helper.confirm verification, for: user
      end
    end
  end
end
