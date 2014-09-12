module Tasuku
  module Concerns::Models::Requirables::InverseRequirable
    extend ActiveSupport::Concern

    included do
      belongs_to :task
      belongs_to :requirement, class_name: "Task"

      validates :task, :requirement, presence: true
    end
  end
end
