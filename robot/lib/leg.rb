class Leg	
	attr_accessor :position, :type

	def initialize(leg_type = true)
		# leg_type: true for right leg, false for left leg
		@position = "straight"
		@type = leg_type
	end

	def lift
		@position = "lifted"
	end

	def stand
		@position = "straight"
	end
end