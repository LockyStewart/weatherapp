require 'httparty'
require './location_class.rb'

puts 'Welcome to your weather app! Please enter a zipcode.'
zipcode = gets.chomp.to_i

location = Conditions.new(zipcode)
puts location.current_conditions

# sd1 = Conditions.new(92116)
# p sd1.data_hash
