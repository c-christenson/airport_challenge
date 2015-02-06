class Plane

	attr_reader :status

	def initialize
		@status = :flying
	end

	def takeoff
		@status = :flying
		self
	end

	def land
		@status = :landed
		self
	end

end