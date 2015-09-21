require 'minitest/autorun'
require 'minitest/pride'
require './current_observation'
require './sun_rise_set.rb'
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


  def test_sunrise_and_sunset
     assert_equal "7:01 a.m.", SunRiseSet.new(27613).sun_rise
     assert_equal "19:13 p.m.", SunRiseSet.new(27613).sun_set
   end


end
