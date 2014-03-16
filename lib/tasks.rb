require "tasks/engine"
require "tasks/concerns"

require "configatron/core"

module Tasks
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configatron::Store.new

      @config.author = :current_user

      @config
    end
  end
end
