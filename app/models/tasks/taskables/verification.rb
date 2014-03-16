module Tasks
  module Taskables
    class Verification < ActiveRecord::Base
      extend Taskable

      has_one :task, as: :taskable
      belongs_to :verifiable, polymorphic: true
      has_many :confirmations

      validates :verifiable_id, allow_blank: true, uniqueness: { scope: [:verifiable_type] }

      submissions are: :confirmations

      def to_s
        verifiable
      end
    end
  end
end
