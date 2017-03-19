require 'httparty'

class Conditions
  def initialize(zipcode)
    @zipcode = zipcode
    @conditions = HTTParty.get("http://api.wunderground.com/api/b9eca8144b43a825/conditions/q/#{zipcode}.json")
  end

  def current_conditions
    @city = @conditions["current_observation"]['display_location']['city']
    @temperature = @conditions["current_observation"]['temp_f']
    @clouds = @conditions["current_observation"]['weather']
    @precip = @conditions["current_observation"]['precip_today_in'].to_i

    puts "In #{@city} the current temperature is #{@temperature} degrees farenheit, and it is slightly #{@clouds}."
    if @precip>0.0 then
      puts "About #{@precip}in. of rain have fallen."
    else
      puts "No rain has fallen recently."
    end
  end

  def city
    @city = @conditions["current_observation"]['display_location']['city']
  end
end
