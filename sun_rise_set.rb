require 'json'
require 'httparty'

class SunRiseSet
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def sun_rise
    @response["sun_phase"]["sunrise"]["hour"] +":" + @response["sun_phase"]["sunrise"]["minute"]+ " a.m."
  end

  def sun_set
    @response["sun_phase"]["sunset"]["hour"] +":" + @response["sun_phase"]["sunset"]["minute"]+ " p.m."
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip_code}.json")
    # file = File.read('sun_rise_sun_set.json')
    # data_hash = JSON.parse(file)
  end
end

# puts "Enter your zip code"
# api = SunRiseSet.new(gets.chomp)
# puts "The sunrise is expected to be at; #{api.sun_rise}"
# puts "The sunset is expected to be at; #{api.sun_set}"
