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

    end
  end
