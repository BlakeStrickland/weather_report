require 'json'
class TenDayForecast
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def ten_day_conditions
    # binding.pry
    simplified = {}
    @response["forecast"]["simpleforecast"]["forecastday"].each do |x|
      my_pretty = x['date']['monthname'].to_s + " " + x['date']['day'].to_s + ", " + x['date']['weekday'].to_s
      simplified[my_pretty] = x["conditions"]
    end
    simplified
  end

  private def get_response
    file = File.read('10_day_forecast.json')
    data_hash = JSON.parse(file)
  end
end

# puts "Enter your zip code"
# api = TenDayForecast.new(gets.chomp)
# results = api.ten_day_conditions
# results.each do |x, y|
#   puts "#{x}: #{y}"
# end
