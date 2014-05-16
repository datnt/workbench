require "state_machine"

class Arm	
	attr_accessor :position, :type

	def initialize(arm_type = true)
		# arm_type: true for right arm, false for left arm
		@position = StateMachine.new(["dropped", "liftup"])
		@type = arm_type
	end

	def liftup
		@position.transition("liftup")
	end

	def drop
		@position.transition("dropped")
	end

	def is_dropped?
		@position.current_state == "dropped"
	end
end