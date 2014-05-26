module Tasuku
  module Taskables
    class URL::Response < ActiveRecord::Base
      include Taskable::Submission
      include Embeddable

      embeddable :video, from: :url

      belongs_to :request
      belongs_to :author, polymorphic: true

      validates :author_id, :author_type, presence: true
      validates :url, presence: true

      request is: :request
    end
  end
end
