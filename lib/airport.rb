require_relative 'weather_conditions'

class Airport 

include WeatherConditions

	def initialize(capacity: 6)
		@capacity = capacity
		@landed_planes = []
	end

	def let_plane_land(plane)
		raise "Airport is full" if full?
		raise "Permission to land denied: the weather is too stormy." if stormy?
		@landed_planes << plane
		plane.land	
	end

	def tell_plane_to_takeoff(plane)
		raise "Permission to takeoff denied: the weather is too stormy." if stormy?
		@landed_planes.delete(plane)
		plane.takeoff
	end

	def landed_plane_count
		@landed_planes.count
	end

	def full?
		landed_plane_count == @capacity
	end

