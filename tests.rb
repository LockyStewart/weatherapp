require 'minitest/autorun'
require 'minitest/untz'
require './location_class.rb'

class APITest < Minitest::Test

  def test_initialize
    assert Conditions.new(27707)
  end

  def test_city
    sd = Conditions.new('92116')
    assert sd.city == 'San Diego'
  end

  def test_api_call
    sd1 = Conditions.new('92116')
    sd2 = HTTParty.get("http://api.wunderground.com/api/b9eca8144b43a825/conditions/q/92116.json")
    assert_equal sd1.data_hash["current_observation"]['temp_f'],sd2["current_observation"]['temp_f']
  end

end
