$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "standarized_deploy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "standarized_deploy"
  s.version     = StandarizedDeploy::VERSION
  s.authors     = ["Wojtek Majewski"]
  s.email       = ["jumski@gmail.com"]
  s.homepage    = "http://webmandala.com"
  s.summary     = "Set of capistrano scripts for use with our standarized stack"
  s.description = "Set of capistrano scripts for use with our standarized stack"

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.0"
  s.add_dependency 'capistrano'
  s.add_dependency 'capistrano_colors'
  s.add_dependency 'rvm-capistrano'
end
