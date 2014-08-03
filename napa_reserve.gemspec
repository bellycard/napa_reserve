# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'napa_reserve/version'

Gem::Specification.new do |spec|
  spec.name          = "napa_reserve"
  spec.version       = NapaReserve::VERSION
  spec.authors       = ["Darby Frey"]
  spec.email         = ["darby@bellycard.com"]
  spec.summary       = %q{Like a fine wine, web services get better with age}
  spec.description   = %q{Like a fine wine, web services get better with age}
  spec.homepage      = "https://github.com/bellycard/napa_reserve"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'napa'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
