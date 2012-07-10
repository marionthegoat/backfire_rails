require_relative '../../test_helper'
require_relative '../../factories'
include BackfireRails

class BackfireSessionsControllerSpec < ControllerSpec
  before do
    @controller = BackfireSessionsController.new
    @cookie = "cookie"
    @request.cookies[:session_id] = @cookie
  end

  after do
      BackfireSession.delete(@cookie.to_sym)
  end


  describe "#show" do
    before do
      @backfire_control = FactoryGirl.create(:backfire_control_with_children)
    end
    it "should show session" do
      get :show, backfire_control_id: @backfire_control, id: 1, use_route: :backfire_rails
      assert_response :success
    end
  end

  describe "#create" do
    before do
      @backfire_control = FactoryGirl.create(:backfire_control_with_children)
    end
    it "must load the session workspace" do
        post :create, backfire_control_id: @backfire_control, goal_fact: "fact_1", use_route: :backfire_rails
        assert_response :redirect
        bs = BackfireSession.instance(@cookie.to_sym) # obtain the session to examine it
        bs.determinants.count.must_equal 5
    end
  end


  describe "#update" do
    before do
      @backfire_control = FactoryGirl.create(:rulebase_with_prompt)
      # start session, get it working on goal fact
      post :create, backfire_control_id: @backfire_control, goal_fact: "what_to_buy", use_route: :backfire_rails
      bs = BackfireSession.instance(@cookie.to_sym)
      bs.dump
    end

    it "must accept prompt responses in update" do
      put :update, prompt_response: "true",  use_route: :backfire_rails
      assert_response :redirect
    end
  end

  describe "#delete" do
    before do
      @backfire_control = FactoryGirl.create(:backfire_control_with_children)
      get :show, backfire_control_id: @backfire_control, id: 1, use_route: :backfire_rails
    end
    it "must be able to delete session" do
      delete :destroy, use_route: :backfire_rails
      assert_response :redirect
      BackfireSession.has_instance?(@cookie.to_sym).must_equal false
    end
  end






end