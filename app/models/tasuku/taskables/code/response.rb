module Tasuku
  module Taskables
    class Code::Response < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :request
      belongs_to :author, polymorphic: true

      validates :author_id, :author_type, presence: true
      validates :code, presence: true
      validate :code_is_valid

      request is: :request

      private

      def code_is_valid
        errors.add :code, I18n.t('tasuku.taskables.codes.responses.invalid') unless code == request.code
      end
    end
  end
end
