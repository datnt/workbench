require "spec_helper"
require "arm"

describe Arm do
  describe "survey" do
  	before :each do
      @arm = Arm.new
    end
    context "arm example" do
	  it "is initialized" do
	  	@arm.position.should == "dropped"
	  	@arm.type.should be_true
	  end
	  it "is liftup" do
	  	@arm.liftup
	  	@arm.position.should == "liftup"
	  end

	  it "is is dropped" do
	  	@arm.drop
	  	@arm.position.should == "dropped"
	  end
    end
  end

  it "is is left arm" do
  	arm = Arm.new(false)
  	arm.type.should_not be_true
  end

end