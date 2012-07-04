source "http://rubygems.org"

# Declare your gem's dependencies in backfire-rails.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec
gem 'rails', '3.2.6'
gem 'bootstrap-sass'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'faker', '1.0.1'

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'sqlite3'
  gem 'annotate',
      :git => 'git://github.com/jeremyolliver/annotate_models.git',
      :branch => 'rake_compatibility'
end

group :test do
  gem "minitest"
  gem "capybara"
  gem "capybara_minitest_spec"
  gem "minitest-reporters"
  gem "factory_girl"
  gem "win32console"
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
  gem 'launchy'
end
# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

gem "backfire", :path => "c:/MarionTheGoat/backfire"




# To use debugger
# gem 'debugger'
