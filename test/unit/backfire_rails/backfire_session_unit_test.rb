require_relative '../../test_helper.rb'
include Backfire::Model

  class BackfireSessionTest < MiniTest::Spec
    describe BackfireSession do
      before do
        @params = FactoryGirl.create(:backfire_control)
        @session = BackfireSession.instance(:fred, @params)
      end

      it "should deliver named instance" do
        @session.wont_be_nil
        @session.key.must_equal :fred
      end

      it "should respond to key" do
        @session.must_respond_to :key
      end

      it "should respond to current_prompt" do
        @session.must_respond_to :current_query
      end

      it "should respond to prompt_response" do
        @session.must_respond_to :prompt_response=
      end



    end
  end
