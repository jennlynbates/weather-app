#uses the yahoo_weatherman gem get Class List: http://www.rubydoc.info/github/dlt/yahoo_weatherman/Weatherman/Response#condition-instance_method

require 'yahoo_weatherman'

def get_location(location)
client = Weatherman::Client.new
client.lookup_by_location(location)
end
#get zipcode from user
puts "Enter zipcode to get forecast: "
location = gets.chomp
#sets zipcode from user to the weather variable
weather = get_location(location)
today = Time.now.strftime('%w').to_i
#if statements for today and tomorrow, remainer as the name of the day
weather.forecasts.each do |forecast|
day = forecast['date']
weekday = day.strftime('%w').to_i
if weekday ==today
	dayName = 'Today'
elsif weekday == today + 1
	dayName = 'Tomorrow'
else
	dayName = day.strftime('%A')
end
#puts statement
puts dayName + ' is going to be ' + forecast['text'].downcase + 
' with a low of ' + forecast['low'].to_s + 
' and a high of ' + forecast['high'].to_s
end
	


