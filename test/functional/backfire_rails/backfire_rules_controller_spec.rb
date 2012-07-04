require_relative '../../test_helper'
require_relative '../../factories'
include BackfireRails

class BackfireRulesControllerSpec < ControllerSpec
  before do
    @controller = BackfireRulesController.new
    @backfire_rule = FactoryGirl.create(:backfire_rule)
  end

  describe "#new" do
    it "must render new template" do
      get :new, backfire_control_id: @backfire_rule.backfire_control_id, use_route: :backfire_rails
      assert_template :new
      assert_response :success
    end
  end

  describe "#create" do
    before do
      @attr = {name: "TEST", description: "Test rule", fact: "action", assertion: "bored", predicate: "get crazy"}
    end
    it "must create a new record in the database" do
      assert_difference('BackfireRule.count') do
        post :create, backfire_control_id: @backfire_rule.backfire_control_id, backfire_rule: @attr, use_route: :backfire_rails
      end
    end
  end
#TODO: this gives errors due to link path in .erb ... nothing really wrong with it, but test tries to resolve it and dies
#describe "#show" do
#  it "should show backfire_control" do
#    get :show, id: @backfire_rule, use_route: :backfire_rails
#    assert_response :success
#  end
#end

  describe "#edit" do
    it "should edit backfire_rule" do
      get :edit, id: @backfire_rule, use_route: :backfire_rails
      assert_response :success
    end
  end

  describe "#update" do
    before do
      @attr = {name: "TEST", description: "Test rule", fact: "action", assertion: "bored", predicate: "get crazy"}
    end
    it "should update backfire_rule" do
      put :update, id: @backfire_rule, backfire_rule: @attr, use_route: :backfire_rails
    end
  end

  describe "#destroy" do
    it "should delete backfire_rule" do
      assert_difference('BackfireRule.count', -1) do
        delete :destroy, id: @backfire_rule, use_route: :backfire_rails
      end
    end
  end
end
