require 'faraday_api_cache/version'
require 'faraday_api_cache/middleware'

Faraday::Request.register_middleware api_cache: FaradayAPICache::Middleware
