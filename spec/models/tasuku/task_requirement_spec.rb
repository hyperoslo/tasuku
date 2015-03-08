require 'spec_helper'

module Tasuku
  describe TaskRequirement do
    it "has valid factory" do
       expect(build :task_requirement).to be_valid
    end
  end
end
