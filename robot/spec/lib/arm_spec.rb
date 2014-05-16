require "spec_helper"
require "arm"

describe Arm do
  describe "survey" do
  	before :each do
      @arm = Arm.new
    end
    context "arm example" do
	  it "is initialized" do
	  	@arm.position.current_state.should == "dropped"
	  	@arm.type.should be_true
	  end
	  it "is liftup" do
	  	@arm.liftup
	  	@arm.position.current_state.should == "liftup"
	  end

	  it "is dropped" do
	  	@arm.drop
	  	@arm.position.current_state.should == "dropped"
	  end

	  it "has valid check for lift" do
	  	@arm.liftup
	  	@arm.is_dropped?.should eq(false)
	  end

	  it "has valid check for drop" do
	  	@arm.drop
	  	@arm.is_dropped?.should eq(true)
	  end
    end
  end

  it "is left arm" do
  	arm = Arm.new(false)
  	arm.type.should_not be_true
  end

end