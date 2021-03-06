require 'spec_helper'

module Tasuku
  describe Taskables::VerificationsHelper do
    describe '#confirm' do
      let(:user)         { create :user }
      let(:verification) { create :verification }

      it 'renders a partial' do
        expect(helper).to receive(:render).with(
          partial: 'tasuku/taskables/verifications/confirmations/form.html.erb', locals: {
            confirmation: an_instance_of(Taskables::Verification::Confirmation)
          }
        )

        helper.confirm verification
      end
    end
  end
end
