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

end
