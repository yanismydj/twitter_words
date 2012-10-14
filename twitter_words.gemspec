# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_words/version'

Gem::Specification.new do |gem|
  gem.name          = "twitter_words"
  gem.version       = TwitterWords::VERSION
  gem.authors       = ["Yan Lhert"]
  gem.email         = ["info@yanlhert.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'simple_oauth'
  gem.add_dependency 'faraday'
  gem.add_dependency 'active_support'
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "debugger"
end
