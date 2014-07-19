require 'faraday'
require 'api_cache'

module FaradayAPICache
  class Middleware < Faraday::Middleware
    def initialize(app, options = {})
      super(app)
      @options = { period: 0, timeout: 0 }.merge(options.to_hash)
    end

    def call(env)
      if env[:method] == :get
        APICache.get(env[:url].to_s, @options) do
          @app.call(env)
        end
      else
        @app.call(env)
      end
    end

    def self.clear
      self.store = APICache::MemoryStore.new
    end

    def self.logger=(logger)
      APICache.logger = logger
    end

    def self.store=(store)
      APICache.store = store
    end
  end
end
