module Tasks
  module Concerns::Models::Taskables::Verification
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      belongs_to :verifiable, polymorphic: true
      has_many :confirmations, dependent: :destroy

      validates :verifiable_id, allow_blank: true, uniqueness: { scope: [:verifiable_type] }

      responses are: :confirmations

      def to_s
        verifiable.to_s
      end
    end
  end
end
