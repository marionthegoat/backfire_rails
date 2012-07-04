require_relative '../../test_helper.rb'
require_relative '../../test_models'

include BackfireRails

class BackfireControlTest < MiniTest::Spec

  describe BackfireControl do

    it "has a configurable name field" do
      BackfireControl.control_rulebase_name_field.must_equal "name"
    end

    it "has a configurable rulechain option field" do
      BackfireControl.control_rulechain_option_field.must_equal "rulechain_option"
    end

    it "has a configurable runaway limit field" do
      BackfireControl.control_runaway_limit_field.must_equal "runaway_limit"
    end

    it "has a configurable log output field" do
      BackfireControl.control_log_output_field.must_equal "log_output"
    end

    describe "responds to default attributes" do
      before do
        @control = BackfireControl.new
      end
      it "responds to its default attributes" do
      @control.must_respond_to :name
      @control.must_respond_to :rulechain_option
      @control.must_respond_to :runaway_limit
      @control.must_respond_to :log_output
      @control.must_respond_to :description # this isn't part of the acts_as stuff
      end
    end

  end

  describe AltControl do

    it "has a configurable name field" do
      AltControl.control_rulebase_name_field.must_equal "rulebase_name"
    end

    it "has a configurable rulechain option field" do
      AltControl.control_rulechain_option_field.must_equal "forward_back"
    end

    it "has a configurable runaway limit field" do
      AltControl.control_runaway_limit_field.must_equal "max_iterations"
    end

    it "has a configurable log output field" do
      AltControl.control_log_output_field.must_equal "show_trace"
    end

    # this uses sample class definition provided by test_helper.rb
    describe "responds to configurable attributes" do
      before do
        @alt_control = AltControl.new
      end
      it "responds to configurable attributes" do
      @alt_control.must_respond_to :rulebase_name
      @alt_control.must_respond_to :forward_back
      @alt_control.must_respond_to :max_iterations
      @alt_control.must_respond_to :show_log
      end
    end
  end

end