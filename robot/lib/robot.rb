require "arm"
require "leg"
require "head"
require "state_machine"

class Robot	
	attr_accessor :name, :left_arm, :right_arm, :right_leg, :left_leg, :head

	def initialize(name = "Dummy")
	  @name = name
	  @right_arm =  Arm.new(true)
	  @left_arm =  Arm.new(false)
	  @right_leg = Leg.new(true)
	  @left_leg = Leg.new(false)
	  @head = Head.new
	end

	def hungry?
		false
	end

	def stand
		@right_leg.stand
		@left_leg.stand
	end

	def fall
		@right_leg.lift
		@left_leg.lift
	end

	def jump
		@right_arm.liftup
		@left_arm.liftup
		@right_leg.lift
		@left_leg.lift
	end

	def open_eyes
		@head.left_eye.open
		@head.right_eye.open
	end

	def close_eyes
		@head.left_eye.close
		@head.right_eye.close
	end
end