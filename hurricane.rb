
require 'httparty'

require 'json'
class Hurricanes
  def initialize()
    @response = get_response
  end

  def hurricane_info
    simplified = []
    @response["currenthurricane"].each do |x|
      simplified << x["stormInfo"]["stormName"]
    end
    simplified
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/currenthurricane/view.json")
    # file = File.read('hurricanes.json')
    # data_hash = JSON.parse(file)
  end
end

#
# api = Hurricanes.new()
# puts "These hurricanes are raging; #{api.hurricane_info}"
