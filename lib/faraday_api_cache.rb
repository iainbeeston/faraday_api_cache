require 'faraday_api_cache/version'
require 'faraday_api_cache/middleware'

module FaradayAPICache
  class << self
    def logger=(logger)
      APICache.logger = logger
    end

    def store=(store)
      APICache.store = store
    end
  end
end

Faraday::Request.register_middleware api_cache: FaradayAPICache::Middleware
