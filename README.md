# Faraday API Cache

This is a [faraday](https://github.com/lostisland/faraday) middleware that integrates [api_cache](https://github.com/mloughran/api_cache) into the faraday middleware stack. Using faraday_api_cache, GET requests using Faraday will be cached automatically.

## Usage

Make sure you have required the faraday_api_cache gem, or included it in your Gemfile. Then add faraday_api_cache as a request middleware:

~~~ruby
farcon = Faraday.new(url: 'http://example.com') do |c|
  c.request :api_cache
  # more config goes here...
end
~~~

That's it!

faraday_api_cache passes any hash arguments to api_cache - see the [api_cache documentation](https://github.com/mloughran/api_cache) for more details (but the `cache` parameter especially is useful).

faraday_api_cache also provides helper methods to change the logger and cache store used by api_cache:

~~~ruby
FaradayAPICache.logger = Rails.logger
FaradayAPICache.store = Moneta.new(:Memcached)
~~~

## Why use faraday_api_cache

There are already good middleware for caching in Faraday. For example, [faraday-http-cache](https://github.com/plataformatec/faraday-http-cache) and the caching middleware in [faraday_middleware](https://github.com/lostisland/faraday_middleware). The former takes cache settings from the response headers, but it's not suitable if you don't trust the server or want shorter or longer cache times than the headers recommend. The latter really is equivelent to faraday_api_cache, but this gem might make more sense if you're already using api_cache or are more familiar with api_cache.
