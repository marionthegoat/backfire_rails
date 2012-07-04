# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

# minitest setup
require 'active_support/testing/setup_and_teardown'
require 'action_controller/test_case'
require 'capybara/rails'
require 'capybara_minitest_spec'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'factory_girl'
#adapt to the IDE environment if present
MiniTest::Unit.runner = MiniTest::SuiteRunner.new
if ENV["RM_INFO"] || ENV["TEAMCITY_VERSION"]
  MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMineReporter.new
elsif ENV['TM_PID']
  MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMateReporter.new
else
  MiniTest::Unit.runner.reporters << MiniTest::Reporters::ProgressReporter.new
end

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end


# TODO: Can't seem to get the following to work ....  ActionController::TestCase is impregnable
#
#  This is to get around having to specify engine with use_route => in controller methods
#
#module ControllerHacks
#        def get(action, parameters = nil, session = nil, flash = nil)
#          process_action(action, parameters, session, flash, "GET")
#        end
#
#        # Executes a request simulating POST HTTP method and set/volley the response
#        def post(action, parameters = nil, session = nil, flash = nil)
#          process_action(action, parameters, session, flash, "POST")
#        end
#
#        # Executes a request simulating PUT HTTP method and set/volley the response
#        def put(action, parameters = nil, session = nil, flash = nil)
#          process_action(action, parameters, session, flash, "PUT")
#        end
#
#        # Executes a request simulating DELETE HTTP method and set/volley the response
#        def delete(action, parameters = nil, session = nil, flash = nil)
#          process_action(action, parameters, session, flash, "DELETE")
#        end
#
#        private
#
#        def process_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
#          parameters ||= {}
#          process(action, parameters.merge!(:use_route => :backfire_rails), session, flash, method)
#        end
#end


# suppress deprecation warnings coming from minispec by overriding method
module MiniTest::Assertions
  def assert_block msg = nil
    msg = message(msg) { "Expected block to return true value" }
    assert yield, msg
  end
end


class MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActiveRecord::TestFixtures
  include ActiveSupport::Testing::Assertions

  alias :method_name :__name__ if defined? :__name__
  self.fixture_path = File.join( Rails.root, 'test', 'fixtures' )

# ActiveSupport wants this to be in there ...
  def build_message(*args)
    args[1].gsub(/\?/, '%s') % args[2..-1]
  end
end


class ControllerSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include ActionController::TestCase::Behavior

  class << self
    alias :context :describe
  end

  before do
    @routes = Rails.application.routes
  end

end

# Functional tests = describe ***Controller
MiniTest::Spec.register_spec_type( /Controller$/, ControllerSpec )

class IntegrationSpec < ControllerSpec
  include Capybara::DSL
end
