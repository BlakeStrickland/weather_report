require 'minitest/autorun'
require 'minitest/pride'
require './current_observation'
require './sun_rise_set.rb'
require './10_day_forecast'
require './weather_alert'
require './hurricane.rb'
require 'json'

# class CurrentObservation
#   private def get_response
#     @read = File.read("current_observation.json")
#   end
# end


class CurrentTest < Minitest::Test

  def test_current_temp
    assert_equal 79.1, CurrentObservation.new(27613).current_temp
  end

  def test_current_wind
    assert_equal 5.0, CurrentObservation.new(27613).current_wind
  end

  def test_current_weather
    assert_equal "Overcast", CurrentObservation.new(27613).current_weather
  end

  def test_current_visability
    assert_equal "10.0", CurrentObservation.new(27613).current_visability_mi
  end

  def test_10_day
    a = {"September 21, Monday" => "Chance of a Thunderstorm",
        "September 22, Tuesday" => "Overcast",
        "September 23, Wednesday" => "Mostly Cloudy",
        "September 24, Thursday" => "Chance of Rain",
        "September 25, Friday" => "Rain",
        "September 26, Saturday" => "Rain",
        "September 27, Sunday" => "Rain",
        "September 28, Monday" => "Clear",
        "September 29, Tuesday" => "Clear",
        "September 30, Wednesday" => "Clear"
      }
      assert_equal a, TenDayForecast.new(27613).ten_day_conditions
  end

  def test_sunrise_and_sunset
     assert_equal "7:01 a.m.", SunRiseSet.new(27613).sun_rise
     assert_equal "19:13 p.m.", SunRiseSet.new(27613).sun_set
   end

  def test_weather_alert
    a = ["Areal Flood Advisory, Flash Flood Watch"]
    assert_equal a,WeatherAlert.new(27613).weather_alerts
  end

  def test_hurricanes
    a = ["Ida","Twentyone","Sixteen-E","Malia","96C"]
    assert_equal a, Hurricanes.new(27613).hurricane_info
  end

end
