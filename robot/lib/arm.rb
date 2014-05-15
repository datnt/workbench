class Arm	
	attr_accessor :position, :type

	def initialize(arm_type = true)
		# arm_type: true for right arm, false for left arm
		@position = "dropped"
		@type = arm_type
	end

	def liftup
		@position = "liftup"
	end

	def drop
		@position = "dropped"
	end
end