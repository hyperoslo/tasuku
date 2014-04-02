module Tasks
  module Taskables
    class Image::Request < ActiveRecord::Base
      include Taskable

      has_many :responses

      responses are: :responses
    end
  end
end
