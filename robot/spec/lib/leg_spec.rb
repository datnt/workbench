require "spec_helper"
require "leg"

describe Leg do
  describe "survey" do
  	before :each do
      @leg = Leg.new
    end
    context "leg example" do
  	  it "is initialized" do
  	  	@leg.position.current_state == "straight"
  	  	@leg.type.should be_true
  	  end

  	  it "is lifted" do
  	  	@leg.lift
  	  	@leg.position.current_state.should == "lifted"
  	  end

  	  it "is straight" do
  	  	@leg.stand
  	  	@leg.position.current_state.should == "straight"
  	  end

      it "has valid check for straight" do
        @leg.stand
        @leg.is_lifted?.should eq(false)
      end

      it "has valid check for lifted" do
        @leg.lift
        @leg.is_lifted?.should eq(true)
      end

    end
  end

  it "is left leg" do
  	leg = Leg.new(false)
  	leg.type.should_not be_true
  end

  it "is right leg" do
  	leg = Leg.new(true)
  	leg.type.should be_true
  end

end