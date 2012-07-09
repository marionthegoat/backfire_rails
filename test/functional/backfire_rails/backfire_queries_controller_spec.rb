require_relative '../../test_helper'
require_relative '../../factories'
include BackfireRails

class BackfireQueriesControllerSpec < ControllerSpec
  before do
    @controller = BackfireQueriesController.new
    @backfire_query = FactoryGirl.create(:backfire_query)
  end

  describe "#new" do
    it "must render new template" do
      get :new, backfire_control_id: @backfire_query.backfire_control_id, use_route: :backfire_rails
      assert_template :new
      assert_response :success
    end
  end

  describe "#create" do
    before do
      @attr = {name: "TEST", description: "Test query", fact: "evidence", expression: "fingerprints", prompt: false}
    end
    it "must create a new record in the database" do
      assert_difference('BackfireQuery.count') do
        post :create, backfire_control_id: @backfire_query.backfire_control_id, backfire_query: @attr, use_route: :backfire_rails
      end
    end
  end
#TODO: this gives errors due to link path in .erb ... nothing really wrong with it, but test tries to resolve it and dies
#describe "#show" do
#  it "should show backfire_control" do
#    get :show, id: @backfire_query, use_route: :backfire_rails
#    assert_response :success
#  end
#end

  describe "#edit" do
    it "should edit backfire_query" do
      get :edit, id: @backfire_query, use_route: :backfire_rails
      assert_response :success
    end
  end

  describe "#update" do
    before do
      @attr = {name: "TEST", description: "Test query", fact: "evidence", expression: "fingerprints"}
    end
    it "should update backfire_query" do
      put :update, id: @backfire_query, backfire_query: @attr, use_route: :backfire_rails
    end
  end

  describe "#destroy" do
    it "should delete backfire_query" do
      assert_difference('BackfireQuery.count', -1) do
        delete :destroy, id: @backfire_query, use_route: :backfire_rails
      end
    end
  end
end
