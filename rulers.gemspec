# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |gem|
  gem.name          = "rulers"
  gem.version       = Rulers::VERSION
  gem.authors       = ["ChengFernando"]
  gem.email         = ["fernandocheng2010@gmail.com"]

  gem.summary       = %q{A Rack-based Web Framework}
  gem.description   = %q{A Rack-based Web Framework, but with extra awesome}
  gem.homepage      = ""

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if gem.respond_to?(:metadata)
    gem.metadata['allowed_push_host'] = " Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|gem|features)/}) }
  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.11"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "minitest", "~> 5.0"

  gem.add_runtime_dependency "rack"
  gem.add_runtime_dependency "erubis"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "test-unit"
end
