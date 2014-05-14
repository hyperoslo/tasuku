module Tasks
  module Taskables
    class Text::Response < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :request
      belongs_to :author, polymorphic: true

      validates :author_id, :author_type, presence: true
      validates :text, presence: true

      request is: :request
    end
  end
end
