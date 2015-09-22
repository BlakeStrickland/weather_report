require './current_observation'
require './sun_rise_set.rb'
require './10_day_forecast'
require './weather_alert'
require './hurricane.rb'
require 'json'

puts "Enter your zip code"
x = gets.chomp

api = CurrentObservation.new(x)


puts "Your current tempurature is; #{api.current_temp}"
puts "The current wind is; #{api.current_wind}"
puts "The current condition is; #{api.current_weather}"
puts "The current visability is; #{api.current_visability_mi}"

api = TenDayForecast.new(x)
results = api.ten_day_conditions
results.each do |x, y|
  puts "#{x}: #{y}"
end

api = Hurricanes.new()
puts "These hurricanes are raging; #{api.hurricane_info}"


  if x.empty? || nil
    puts "There are no current weather alerts in your area"
  else
    api = WeatherAlert.new(x)
    puts "Your current weather alerts are as follows; #{api.weather_alerts}"
  end

  api = SunRiseSet.new(x)
  puts "The sunrise is expected to be at; #{api.sun_rise}"
  puts "The sunset is expected to be at; #{api.sun_set}"
