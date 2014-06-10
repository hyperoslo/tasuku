require 'spec_helper'

module Tasuku
  describe Taskables::Verification do
    describe 'uniqueness validation on verifiable' do
      let(:article)      { create :article }
      let(:duplicate)    { build :verification, verifiable: article }

      before do
        create :verification, verifiable: article
      end

      it 'prohibits saving multiple verifications for the same verifiable' do
        expect(duplicate).not_to be_valid
      end
    end
  end
end
