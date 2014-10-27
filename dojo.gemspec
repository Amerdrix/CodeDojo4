# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dojo_rest'

Gem::Specification.new do |spec|
  spec.name          = "dojo_rest"
  spec.version       = DojoRest::VERSION
  spec.authors       = ["Courtney de Lautour"]
  spec.email         = ["clautour@thefrontiergroup.com.au"]
  spec.summary       = %q{A simple rest client}
  spec.homepage      = "https://github.com/Amerdrix/CodeDojo4"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", '~> 2.0'
end
