require "spec_helper"
require "robot"

describe Robot do
  describe "survey" do
    before :each do
      @robot = Robot.new
    end
    context "robot example" do
      it "is named Danny" do
        @robot.name.should == "Danny"
      end

      it "has no brains" do
        @robot.brains.should < 1
      end
  
      it "has no life" do
        @robot.alive.should be_false
      end

      it "is rotting" do
        @robot.rotting.should be_true
      end

      it "is hungry" do
        @robot.should_not be_hungry
      end

      it "has right arm" do
        @robot.right_arm.type.should be_true
      end

      it "has left arm" do
        @robot.left_arm.type.should_not be_true
      end

      it "has right leg" do
        @robot.right_leg.type.should be_true
      end

      it "has left leg" do
        @robot.left_leg.type.should_not be_true
      end
    end
  end

  describe "movement" do
    before :each do
      @robot = Robot.new
    end
    context "exercise" do
      it "is standing" do
        @robot.stand
        @robot.left_leg.position.should == "straight"
        @robot.right_leg.position.should == "straight"
      end

      it "is falling" do
        @robot.fall
        @robot.left_leg.position.should == "lifted"
        @robot.right_leg.position.should == "lifted"
      end


      it "is jumping" do
        @robot.jump
        @robot.left_arm.position.should == "liftup"
        @robot.right_arm.position.should == "liftup"
        @robot.left_leg.position.should == "lifted"
        @robot.right_leg.position.should == "lifted"
      end
    end
  end

end