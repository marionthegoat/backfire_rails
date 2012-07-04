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
    #    save_and_open_page
      end

    end

  end

end

