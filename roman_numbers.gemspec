# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roman_numbers/version'

Gem::Specification.new do |spec|
  spec.name          = "roman_numbers"
  spec.version       = RomanNumbers::VERSION
  spec.authors       = ["Munish Goyal"]
  spec.email         = ["munishapc@gmail.com"]
  spec.description   = %q{Conversion between Integers and Roman Numbers}
  spec.summary       = %q{Conversion between Integers and Roman Numbers}
  spec.homepage      = "https://github.com/goyalmunish/roman_numbers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake", ">= 0.9"
  spec.add_development_dependency "awesome_print", ">= 1.2"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "autotest"
  spec.add_development_dependency "simplecov"
  spec.required_ruby_version = '>= 1.9'
end
