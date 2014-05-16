require "spec_helper"
require "robot"

describe Robot do
  describe "survey" do
    before :each do
      @robot = Robot.new
    end
    context "robot example" do
      it "is named Dummy" do
        @robot.name.should == "Dummy"
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

      it "has head" do
        @robot.head.should_not be_nil
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
        @robot.left_leg.is_lifted?.should eq(false)
        @robot.right_leg.is_lifted?.should eq(false)
      end

      it "is falling" do
        @robot.fall
        @robot.left_leg.is_lifted?.should eq(true)
        @robot.right_leg.is_lifted?.should eq(true)
      end

      it "is jumping" do
        @robot.jump
        @robot.left_arm.is_dropped?.should eq(false)
        @robot.right_arm.is_dropped?.should eq(false)
        @robot.left_leg.is_lifted?.should eq(true)
        @robot.right_leg.is_lifted?.should eq(true)
      end

      it "opens eyes" do
        @robot.open_eyes
        @robot.head.left_eye.is_open?.should eq(true)
        @robot.head.right_eye.is_open?.should eq(true)
      end

      it "closes eyes" do
        @robot.close_eyes
        @robot.head.left_eye.is_open?.should eq(false)
        @robot.head.right_eye.is_open?.should eq(false)
      end
    end
  end

end