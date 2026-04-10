# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moneybird/version'

Gem::Specification.new do |spec|
  spec.name          = "moneybird"
  spec.version       = Moneybird::VERSION
  spec.authors       = ["Maarten van Vliet"]
  spec.email         = ["maartenvanvliet@gmail.com"]

  spec.summary       = %q{Library to interface with Moneybird API}
  spec.description   = %q{Library to interface with Moneybird API: http://developer.moneybird.com/}
  spec.homepage      = "https://github.com/odeva-labs/moneybird"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.1.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", '>= 7.0'
  spec.add_dependency "faraday", ">= 2.0.1"
  spec.add_dependency "link_header", "~> 0.0.8"

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 3.1"
end
