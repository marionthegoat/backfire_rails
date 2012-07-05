require_relative '../../test_helper.rb'
include Backfire::Model

  class BackfireSessionTest < MiniTest::Spec
    describe BackfireSession do
      before do
        @params = ControlParam.new("TEST") # using the basic Backfire control class here
        @session = BackfireSession.instance(:fred, @params)
      end

      it "should deliver named instance" do
        @session.wont_be_nil
        @session.key.must_equal :fred
      end

      it "should respond to key" do
        @session.must_respond_to :key
      end

      it "should respond to workspace" do
        @session.must_respond_to :workspace
      end

      it "should respond to state" do
        @session.must_respond_to :state
      end

      it "should respond to prompt" do
        @session.must_respond_to :prompt
      end

      it "should have an initialized workspace" do
        @session.workspace.wont_be_nil
        @session.workspace.must_be_instance_of Backfire::Model::Workspace
      end

    end
  end
