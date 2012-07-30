require_relative '../../test_helper'
require_relative '../../factories'
include Backfire::Model

  class BackfireSessionTest < MiniTest::Spec
    describe BackfireSession do
      before do
        @params = FactoryGirl.create(:backfire_control)
        @session = BackfireSession.new
        @session.session_key = 'fred'
        @session.backfire_control = @params
        @session.save
      end

      it "should deliver named instance" do
        @session.wont_be_nil
        @session.session_key.must_equal 'fred'
      end

      it "should respond to session_key" do
        @session.must_respond_to :session_key
      end

      it "should respond to current_query" do
        @session.must_respond_to :prompt
      end

      it "should respond to prompt_response" do
        @session.must_respond_to :prompt_response=
      end

      it "should respond to goal_fact" do
        @session.must_respond_to :goal_fact
      end



    end
  end
