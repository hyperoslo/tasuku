module Tasuku
  module UrlHelper
    def url_for(options)
      begin
        super options
      rescue ActionController::UrlGenerationError
        main_app.url_for options
      end
    end
  end
end