module Tasuku
  module ApplicationHelper
    def current_author
      send Tasks.config.author
    end
  end
end
