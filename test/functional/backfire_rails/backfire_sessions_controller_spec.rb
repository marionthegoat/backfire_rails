require_relative '../../test_helper'
require_relative '../../factories'
include BackfireRails

class BackfireSessionsControllerSpec < ControllerSpec
  before do
    @controller = BackfireSessionsController.new
    @backfire_control = FactoryGirl.create(:backfire_control_with_children)
    @cookie = "cookie"
    @request.cookies[:session_id] = @cookie
  end

  describe "#show" do
    it "should show session" do
      get :show, backfire_control_id: @backfire_control, id: 1, use_route: :backfire_rails
      assert_response :success
    end
  end

  describe "#create" do
    it "must load the session workspace" do
        post :create, backfire_control_id: @backfire_control, use_route: :backfire_rails
        assert_response :redirect
        bs = BackfireSession.instance(@cookie.to_sym)
        bs.determinants.count.must_equal 5
    end
  end

  #  end
  #end
  #
  #
  #describe "#create" do
  #  before do
  #    @attr = {key: @key}
  #  end
  #  it "creates and loads instance" do
  #    post :create, backfire_session: @attr, use_route: :backfire_rails
  #    @session.rules.count.must_equal 1
  #    @session.queries.count.must_equal 2
  #  end
  #end
  #
  #describe "#update" do
  #  it "should update backfire_control" do
  #    put :update, id: @session,  backfire_control: @attr, use_route: :backfire_rails
  #  end
  #end






end