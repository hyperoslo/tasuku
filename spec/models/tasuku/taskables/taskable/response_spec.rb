require 'spec_helper'

module Tasuku
  describe Taskables::Taskable::Response do
    let(:response)      { create :response, submittable: text_response }
    let(:text_response) { create :text_response, request: text_request }
    let(:text_request)  { create :text_request }
    let(:task)          { create :task, taskable: text_request }

    describe '.before_destroy' do
      before { response.destroy }

      it 'deletes its submittable' do
        expect(text_response).to be_destroyed
      end
    end
  end
end
