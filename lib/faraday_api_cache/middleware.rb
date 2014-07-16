require 'faraday'
require 'api_cache'

module FaradayAPICache
  class Middleware < Faraday::Middleware
    def initialize(app, options = {})
      super(app)
      @options = options.to_hash
    end

    def call(env)
      if env[:method] == :get
        APICache.get(env[:url].to_s, @options) do
          APICache.logger.debug 'FaradayAPICache cache miss... Caching.'
          @app.call(env)
        end
      else
        APICache.logger.debug 'FaradayAPICache cache hit.'
        @app.call(env)
      end
    end

    def self.clear
      self.store = APICache::MemoryStore.new
    end

    def self.store=(store)
      APICache.store = store
    end
  end
end
