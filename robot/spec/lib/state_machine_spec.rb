require "spec_helper"
require "state_machine"

describe StateMachine do
  it "is defined" do
  	state_machine = StateMachine.new(["open","close"])
  	state_machine.states.should include("open")
  	state_machine.states.should include("close")
  end

  it "is valid without any init data" do
  	state_machine = StateMachine.new
  	state_machine.current_state.should be_nil
  end

  it "can add state" do
  	state_machine = StateMachine.new
  	state_machine.add_state("dropped")
  	state_machine.add_state("liftup")
  	state_machine.states.should include("dropped")
  	state_machine.states.should include("liftup")
  end

  it "has default state" do
  	state_machine = StateMachine.new(["open","close"])
  	state_machine.current_state.should == "open"
  end

  it "has valid transition" do
  	state_machine = StateMachine.new(["open","close"])
  	state_machine.transition("close")
  	state_machine.current_state.should == "close"
  end

  it "does not allow invalid state" do
  	state_machine = StateMachine.new(["open","close"])
  	state_machine.transition("dropped")
  	state_machine.current_state.should == "open"
  end
end