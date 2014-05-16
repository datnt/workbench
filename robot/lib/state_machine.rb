class StateMachine
	attr_accessor :states, :current_state

	def initialize(states = [])
		@states = states
		@current_state = @states[0] if @states.size > 0
	end

	def add_state(state)
		@states << state
	end

	def transition(state)
		if @states.include? state
			@current_state = state
		end
	end


end