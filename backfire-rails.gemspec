$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "backfire-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "backfire-rails"
  s.version     = BackfireRails::VERSION
  s.authors     = ["Lonnie Knechtel"]
  s.email       = ["lonnie@oneinchrr.com"]
  s.homepage    = "https://github.com/marionthegoat"
  s.summary     = "Rails support for Backfire rule engine."
  s.description = "Provides for maintaining Backfire rule bases in Rails application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.5"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
