$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "opinionated_deployment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "opinionated_deployment"
  s.version     = OpinionatedDeployment::VERSION
  s.authors     = ["Wojtek Majewski"]
  s.email       = ["jumski@gmail.com"]
  s.homepage    = "http://webmandala.com"
  s.summary     = "Easy way to set up deployment to opinionated_stack"
  s.description = "Set of capistrano scripts for use with our opinionated_stack"

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  #s.add_dependency "rails", "~> 3.0"
  s.add_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'capistrano'
  s.add_dependency 'capistrano-ext'
  s.add_dependency 'capistrano_colors'
  s.add_dependency 'rvm-capistrano'
end
