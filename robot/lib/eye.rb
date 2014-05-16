require "state_machine"

class Eye
	#Eyes of robot is quite identical, not neccessary for type (i.e left, right)
	attr_accessor :shape, :status

	def initialize(shape = "circle")
		@shape = shape
		@status = StateMachine.new(["open", "close"])
	end

	def close
		@status.transition("close")
	end

	def open
		@status.transition("open")
	end

	def is_open?
		@status.current_state == "open"
	end

end