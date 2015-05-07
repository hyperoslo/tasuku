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
      @config ||= Configatron::Store.new author: :current_user
      @config ||= Configatron::Store.new update_answers: false
      @config
    end
  end
end

Tasks = Tasuku
