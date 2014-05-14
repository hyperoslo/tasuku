module Tasks
  module Taskables
    class Text::Request < ActiveRecord::Base
      include Concerns::Models::Taskables::Text::Request
    end
  end
end
