require 'minitest/autorun'
require 'minitest/untz'
require './location_class.rb'

class Conditions
  def get
    JSON.parse(File.read('92116.json'))
  end
end

class APITest < Minitest::Test

  def test_initialize
    assert Conditions.new('27707')
  end

  def test_city
    sd = Conditions.new('92116')
    assert_equal 'San Diego', sd.city
  end

  def test_temp
    sd1 = Conditions.new('92116')
    assert_equal 68.2, sd1.data_hash['current_observation']['temp_f']
  end

end
