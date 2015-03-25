# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bigquery-table/version'

Gem::Specification.new do |spec|
  spec.name          = "bigquery-table"
  spec.version       = BigqueryTable::VERSION
  spec.authors       = ["takehito sato"]
  spec.email         = ["takehitosato@gmail.com"]

  spec.summary       = %q{create bigquery table from json schema}
  spec.homepage      = "https://github.com/takesato/bigquery-table"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rr'
  spec.add_development_dependency 'test-unit', '~> 3.0.2'
  spec.add_development_dependency 'test-unit-rr', '~> 1.0.3'
  spec.add_development_dependency 'thor'
  spec.add_development_dependency "bigquery-client"
end
