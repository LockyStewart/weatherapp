require 'httparty'

#conditions = HTTParty.get('http://api.wunderground.com/api/b9eca8144b43a825/conditions/q/27707.json')

# class Conditions
#   def initialize(city:, temp:, clouds:, precip:)
#     @city = conditions["current_observation"]['display_location']['city']
#     @temp = conditions["current_observation"]['temp_f']
#     @clouds = conditions["current_observation"]['weather']
#     @precip = conditions["current_observation"]['precip_today_in']
#   end
#   def city
#     @city
#   end
# end

class Conditions
  def initialize(zipcode)
    @zipcode = zipcode
    @conditions = HTTParty.get("http://api.wunderground.com/api/b9eca8144b43a825/conditions/q/#{zipcode}.json")
  end

  def city
    @city = @conditions["current_observation"]['display_location']['city']
  end

  def temp
    @temperature = @conditions["current_observation"]['temp_f']
  end

end
