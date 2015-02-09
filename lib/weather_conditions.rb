module WeatherConditions

	DEFAULT_WEATHER = :sunny
	CHANCE_OF_STORM = 20


	def check_weather
		return :sunny if rand(101) > CHANCE_OF_STORM
		:stormy
	end

	def stormy?
		check_weather == :stormy
	end

	def sunny?
		check_weather == :sunny
	end
end