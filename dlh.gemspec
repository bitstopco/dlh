# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dlh/version'

Gem::Specification.new do |spec|
  spec.name          = "dlh"
  spec.version       = Dlh::VERSION
  spec.authors       = ["Dainel Vera"]
  spec.email         = ["dan@bitstop.co"]

  spec.summary       = %q{A set of tools for driver license data.}
  spec.description   = %q{A simple set of tools to work with drivers license pdf417 data.}
  spec.homepage      = "https://github.com/bitstopco/dlh"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['LICENSE.md', 'README.md', 'lib/**/*']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11.3"

  spec.add_dependency "fullname-parser", "~> 1.1.3"
end
