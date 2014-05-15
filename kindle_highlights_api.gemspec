# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kindle_highlights_api/version'

Gem::Specification.new do |spec|
  spec.name          = "kindle_highlights_api"
  spec.version       = KindleHighlightsAPI::VERSION
  spec.authors       = ["Gaurav Chande"]
  spec.email         = ["gmail@gauravchande.com"]
  spec.summary       = %q{A wrapper that helps fetch Kindle highlights and play around with them.}
  spec.homepage      = "https://github.com/gauravmc/kindle_highlights_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "mechanize", "~> 0"
end
