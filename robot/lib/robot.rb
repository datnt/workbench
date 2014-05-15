require "arm"
require "leg"

class Robot	
	attr_accessor :name, :brains, :alive, :rotting, :left_arm, :right_arm, :right_leg, :left_leg

	def initialize
	  @name = "Danny"
	  @brains = 0
	  @alive = false
	  @rotting = true
	  @right_arm =  Arm.new(true)
	  @left_arm =  Arm.new(false)
	  @right_leg = Leg.new(true)
	  @left_leg = Leg.new(false)
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
end