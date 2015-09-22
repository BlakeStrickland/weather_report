require 'json'
require 'httparty'

class WeatherAlert
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def weather_alerts
    simplified = []
    @response["alerts"].each do |x|
      simplified << x["description"]
    end
    simplified
  end


  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zip_code}.json")
    # file = File.read('weather_alert.json')
    # data_hash = JSON.parse(file)
  end
end

# puts "Enter your zip code"
# x = gets.chomp
#
#   if x.empty? || nil
#     puts "There are no current weather alerts in your area"
#   else
#     api = WeatherAlert.new(x)
#     puts "Your current weather alerts are as follows; #{api.weather_alerts}"
#   end
