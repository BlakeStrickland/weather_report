require 'json'
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
    file = File.read('sun_rise_sun_set.json')
    data_hash = JSON.parse(file)
  end
end


api = SunRiseSet.new(27613)
puts api.sun_rise
puts api.sun_set
