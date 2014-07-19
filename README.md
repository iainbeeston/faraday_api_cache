# Faraday API Cache

This is a [faraday](https://github.com/lostisland/faraday) middleware that integrates [API Cache](https://github.com/mloughran/api_cache) into the faraday middleware stack. Using Faraday API Cache, GET requests using Faraday will be cached automatically.

## Usage

Make sure you have required the Faraday API Cache gem, or included it in your Gemfile. Then add Faraday API Cache as a request middleware:

~~~ruby
farcon = Faraday.new(url: 'http://example.com') do |c|
  c.request :api_cache
  # more config goes here...
end
~~~

That's it!

Faraday API Cache passes any hash arguments to API Cache - see the [API Cache documentation](https://github.com/mloughran/api_cache) for more details (but the `cache` parameter especially is useful).

Faraday API Cache also provides helper methods to change the logger and cache store used by API Cache:

~~~ruby
FaradayAPICache.logger = Rails.logger
FaradayAPICache.store = Moneta.new(:Memcached)
~~~

## Why use Faraday API Cache?

There are already good middleware for caching in Faraday:

* [faraday-http-cache](https://github.com/plataformatec/faraday-http-cache) takes cache settings from the expiry and modified response headers, whereas Faraday API Cache lets the developer set the cache expiry.
* The caching middleware in [faraday_middleware](https://github.com/lostisland/faraday_middleware) is equivelent to Faraday API Cache, but if you're already using API Cache then it might make more sense to use Faraday API Cache.

## Credits

Faraday API Cache was originally written by [Ismael Celis](https://github.com/ismasan), but was open sourced and is now maintained by [Iain Beeston](https://github.com/iainbeeston).