# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'damper/version'

Gem::Specification.new do |spec|
  spec.name          = "damper"
  spec.version       = Damper::VERSION
  spec.authors       = ["Artem Petrov", "Vagin Alexander"]
  spec.email         = ["partos0511@gmail.com", "laplugin73@gmail.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5"
  spec.add_development_dependency "webmock", "~> 1.15.2"
  spec.add_development_dependency "wrong", "~> 0.7.0"

  spec.add_runtime_dependency "reel", "0.4.0"
  spec.add_runtime_dependency "redis", "3.0.5"

end
