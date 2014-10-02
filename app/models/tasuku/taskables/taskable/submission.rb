module Tasuku
  module Taskables::Taskable::Submission
    extend ActiveSupport::Concern

    included do
      include Concerns::Models::Taskables::Taskable::Submission
    end
  end
end
