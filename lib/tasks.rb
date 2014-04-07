require "tasks/engine"
require "tasks/concerns"

require "configatron/core"
require "carrierwave"

module Tasks
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configatron::Store.new author: :current_user

      @config
    end
  end
end
