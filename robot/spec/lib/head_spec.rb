require "spec_helper"
require "head"

describe Head do
	
  it "is valid" do
  	head = Head.new
  	head.shape.should == "cube"
  end

  it "is sphere" do
  	head = Head.new("sphere")
  	head.shape.should == "sphere"
  end

  describe "survey" do
  	context "movement" do
  		before :each do
  			@head = Head.new
  		end

		it "can turn left" do
			@head.turn("left")
			@head.position.current_state.should == "left"
		end

		it "can turn right" do
		  	@head.turn("right")
		  	@head.position.current_state.should == "right"
		end

		it "can look forward" do
			head = Head.new
			head.turn("straight")
			head.position.current_state.should == "straight"
		end

		it "cannot look down" do 
			head = Head.new
			head.turn("down")
			head.position.current_state.should == "straight"
		end
   	end
  end

end