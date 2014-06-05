require 'spec_helper'

RSpec.shared_examples "trackable submission" do
  describe "callbacks for response" do
    it "create response on trackable create" do
      expect(Tasks::Taskables::Taskable::Response.count).to eq(1)
    end

    it "destroy response on trackable destroy" do
      subject.destroy
      expect(Tasks::Taskables::Taskable::Response.count).to eq(0)
    end
  end
end