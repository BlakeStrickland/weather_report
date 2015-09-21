require 'minitest/autorun'
require 'minitest/pride'
require './repo_count'


class WundergroundAstronomy
  private def get_response
    File.open()
  end
end


class Astronomy_test < Minitest::Test

  def test_age_of_moon
    assert_equal 8, WundergroundAstronomy.new("Sydney").age_of_moon
  end
end
