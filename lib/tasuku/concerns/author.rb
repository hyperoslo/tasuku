module Tasuku::Concerns::Author
  extend ActiveSupport::Concern

  included do
    has_many :task_responses, dependent: :destroy, as: :author,
      class_name: '::Tasuku::Taskables::Taskable::Response'
  end
end
