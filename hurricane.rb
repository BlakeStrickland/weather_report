
require 'json'
class Hurricanes
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  # def hurricane_info
  #   @response["currenthurricane"].first["stormInfo"]["stormName"]
  # end


  def hurricane_info
    simplified = []
    @response["currenthurricane"].each do |x|
      simplified << x["stormInfo"]["stormName"]
    end
    simplified
  end




  private def get_response
    file = File.read('hurricanes.json')
    data_hash = JSON.parse(file)
  end
end
# 
# api = Hurricanes.new(27613)
# puts api.hurricane_info
