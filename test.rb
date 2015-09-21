require 'minitest/autorun'
require 'minitest/pride'
require './current_observation'
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
end
