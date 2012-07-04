require_relative '../../test_helper.rb'
require_relative '../../test_models'

module BackfireRails
  class BackfireRuleTest < MiniTest::Spec
    describe BackfireRule do
      before do
        @rule = BackfireRule.new
      end

      it "should respond to name" do
        @rule.must_respond_to :name
      end

      it "should respond to fact" do
        @rule.must_respond_to :fact
      end

      it "should respond to description" do
        @rule.must_respond_to :description
      end

      it "should respond to assertion" do
        @rule.must_respond_to :assertion
      end

      it "should respond to predicate" do
        @rule.must_respond_to :predicate
      end

    end

    describe AltRule do
      before do
        @alt_rule = AltRule.new
      end

      it "should respond to alternate name" do
        @alt_rule.must_respond_to :rule_name
      end

      it "should respond to alternate fact" do
        @alt_rule.must_respond_to :target_fact
      end

      it "should respond to alternate assertion" do
        @alt_rule.must_respond_to :rule_assertion
      end

      it "should respond to alternate predicate" do
        @alt_rule.must_respond_to :rule_predicate
      end

    end
  end
end
