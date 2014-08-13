require 'spec_helper'

module Tasuku
  describe Taskables::Code::Response do
    let(:request)  { create :code_request, code: '1337' }
    let(:user)     { create :user }

    describe 'validations' do
      context 'with an invalid code' do
        let(:response) { build :code_response, author: user, request: request, code: '0000' }

        it 'is not valid' do
          expect(response).not_to be_valid
        end
      end

      context 'with a valid code' do
        let(:response) { build :code_response, author: user, request: request, code: '1337' }

        it 'is valid' do
          expect(response).to be_valid
        end
      end
    end

  end
end
