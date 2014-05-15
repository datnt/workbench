require "spec_helper"
require "leg"

describe Leg do
  describe "survey" do
  	before :each do
      @leg = Leg.new
    end
    context "leg example" do
	  it "is initialized" do
	  	@leg.position.should == "straight"
	  	@leg.type.should be_true
	  end

	  it "is lifted" do
	  	@leg.lift
	  	@leg.position.should == "lifted"
	  end

	  it "is straight" do
	  	@leg.stand
	  	@leg.position.should == "straight"
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