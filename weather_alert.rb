require 'json'

class WeatherAlert
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end


  # def weather_alerts
  #   @response["alerts"][0]["description"]
  # end


  def weather_alerts
    # binding.pry
    simplified = []
    @response["alerts"].each do |x|
      #my_pretty = x["stormName_Nice"].to_s
      simplified << x["description"]
    end
    simplified
  end


  private def get_response
  file = File.read('weather_alert.json')
    data_hash = JSON.parse(file)
  end
end

api = WeatherAlert.new(27613)
 puts api.weather_alerts
