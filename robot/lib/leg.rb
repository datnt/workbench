require "state_machine"

class Leg	
	attr_accessor :position, :type

	def initialize(leg_type = true)
		# leg_type: true for right leg, false for left leg
		@position = StateMachine.new(["straight", "lifted"])
		@type = leg_type
	end

	def lift
		@position.transition("lifted")
	end

	def stand
		@position.transition("straight")
	end

	def is_lifted?
		@position.current_state == "lifted"
	end
end