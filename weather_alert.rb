require 'json'

class WeatherAlert
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end
  def weather_alerts
    @response["alerts"][0]["description"]
  end
  private def get_response
  file = File.read('weather_alert.json')
    data_hash = JSON.parse(file)
  end
end

api = WeatherAlert.new(27613)
 puts api.weather_alerts
