# require 'httparty'

class CurrentObservation
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def current_temp
    @response["current_observation"]["temp_f"]
  end

  def current_wind
    @response["current_observation"]["wind_mph"]
  end

  def current_weather
    @response["current_observation"]["weather"].to_s
  end

  def current_visability_mi
    @response["current_observation"]["visibility_mi"]
  end
  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip_code}.json")

    file = File.read('current_observation.json')
    data_hash = JSON.parse(file)
  end
end

# puts "Enter your zip code"
# api = CurrentObservation.new(gets.chomp)
# puts api.current_temp
# puts api.current_wind
# puts api.current_weather
# puts api.current_visability_mi
