module Tasks
  module Taskables
    class Verification < ActiveRecord::Base
      include Taskable

      has_one :task, as: :taskable, dependent: :destroy
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
