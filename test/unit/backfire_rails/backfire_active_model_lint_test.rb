#require_relative '../../test_helper.rb'
#include Backfire::Model
#class BackfireActiveModelLintTest  < MiniTest::Spec
#  include ActiveModel::Lint::Tests
#  before do
#    @params = FactoryGirl.create(:backfire_control)
#    @model = BackfireSession.instance(:fred, @params)
#  end
#  #
#  # no actual tests needed, the Lint tests are automatically applied to @model in the setup / teardown stuff
#  #
#end