require "spec_helper"
require "eye"

describe Eye do
  it "is has circle shape" do
  	eye = Eye.new
  	eye.shape.should == "circle"
  end

  it "is open" do
  	eye = Eye.new
  	eye.status.current_state == "open"
  end

  it "can close" do
  	eye = Eye.new
  	eye.close
  	eye.is_open?.should eq(false)
  end

  it "can open" do
  	eye = Eye.new
  	eye.open
  	eye.is_open?.should eq(true)
  end

  it "is oval" do
   	eye = Eye.new("oval")
  	eye.shape.should == "oval"
 end

end