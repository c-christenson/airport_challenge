#require_relative 'weather_conditions'

class Airport

#include WeatherConditions

#attr_reader :capacity

	def initialize(capacity: 200)
		@capacity = capacity
		@landed_planes = []
	end

	def let_plane_land(plane)
		raise "Airport is full" if full?
		@landed_planes << plane	
	end

	def tell_plane_to_takeoff(plane)
		@landed_planes.delete(plane)
	end

	def landed_plane_count
		@landed_planes.count
	end

	def full?
		landed_plane_count == @capacity
	end














end