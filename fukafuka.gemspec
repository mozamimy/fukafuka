# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fukafuka/version'

Gem::Specification.new do |spec|
  spec.name          = "fukafuka"
  spec.version       = Fukafuka::VERSION
  spec.authors       = ["mozamimy (Moza USANE)"]
  spec.email         = ["alice@mozami.me"]

  spec.summary       = %q{A simple web application for load testing.}
  spec.description   = %q{A simple web application for load testing.}
  spec.homepage      = "https://github.com/mozamimy/fukafuka"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra"
  spec.add_dependency "sinatra-contrib"
  spec.add_dependency "revision_plate"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
