# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday_api_cache/version'

Gem::Specification.new do |spec|
  spec.name          = "faraday_api_cache"
  spec.version       = FaradayAPICache::VERSION
  spec.authors       = ["Ismael Celis", "Iain Beeston"]
  spec.email         = ["ismaelct@gmail.com", "iain.beeston@gmail.com"]
  spec.summary       = %q{A faraday middleware that uses API Cache to transparently cache requests}
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 1.9"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "api_cache"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
