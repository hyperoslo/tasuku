module Tasks
  module Taskables
    class Image::Request < ActiveRecord::Base
      include Taskable

      has_many :responses

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
