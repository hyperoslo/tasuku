module Tasuku
  module Taskables
    class Code::Response < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :request
      belongs_to :author, polymorphic: true

      validates :author_id, :author_type, presence: true
      validates :code, presence: true
      validate :code_is_valid, if: lambda { |response| response.code.present? }

      request is: :request

      def valid_code?
        code == request.code
      end

      private

      def code_is_valid
        errors.add(:code, I18n.t('tasuku.taskables.codes.responses.invalid')) unless valid_code?
      end
    end
  end
end
