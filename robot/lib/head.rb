require "state_machine"
require "eye"

class Head
	attr_accessor :left_eye, :right_eye, :position, :shape

	def initialize(shape = "cube")
		@left_eye = Eye.new
		@right_eye = Eye.new
		@position = StateMachine.new(["straight","left", "right"])
		@shape = shape
	end

	def turn(type)
		@position.transition(type)
	end

end