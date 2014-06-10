module Tasuku
  module Taskables
    class Image::Request < ActiveRecord::Base
      include Concerns::Models::Taskables::Image::Request
    end
  end
end
