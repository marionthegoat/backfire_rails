require_relative '../test_helper'
require_relative '../factories'

class NavigationTest < IntegrationSpec
  describe "Control Pages" do
    describe "#index" do
      before do
        10.times {FactoryGirl.create(:backfire_control)}
        # visit backfire_controls_path  # this does not work!!!  why ?
        visit '/backfire_controls'
      end
      it "should show index page" do
      #  save_and_open_page
      end


    end

    describe "#show" do
      before do
        FactoryGirl.create(:backfire_control)
        visit 'backfire_controls/1'
      end
      it "should show the details page" do
        save_and_open_page
      end

    end

  end

  describe "Sessions Page" do
    describe "#show" do
      before do
        @backfire_control = FactoryGirl.create(:backfire_control)
        attr = {goal_fact: "what_to_buy", session_key: "fred"}
        @backfire_session = @backfire_control.backfire_sessions.create(attr)
        visit '1/backfire_sessions/1'  # route generation is a little weird
      end
      it "should show the details page" do
        save_and_open_page
        fill_in "goal_fact", with: "blah"
        click_button 'Start Session'
        save_and_open_page
      end

    end
  end

end

