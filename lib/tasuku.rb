require 'tasuku/engine'
require 'tasuku/concerns'

require 'configatron/core'
require 'carrierwave'
require 'embeddable'

module Tasuku
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configatron::Store.new author: :current_user, update_answers: false
    end

    # Set temporary configuration options for the duration of the given block.
    #
    # options - A Hash describing temporary configuration options.
    def temporarily options = {}
      config.temp do
        options.each do |key, value|
          config.send "#{key}=", value
        end
      end
    end

  end
end

Tasks = Tasuku
