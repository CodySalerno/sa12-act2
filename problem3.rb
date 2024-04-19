require 'httparty'
require 'json'

print "Enter timezone area and location (e.g., Europe/London): "
timezone = gets.chomp

response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{timezone}")
if 199 < response.code && response.code < 300
  time_data = JSON.parse(response.body)

  current_time = time_data['datetime']
  formatted_time = DateTime.parse(current_time).strftime("%Y-%m-%d %H:%M:%S")

  puts "The current time in #{timezone} is #{formatted_time}"
else
  puts "Failed to retrieve time data for #{timezone}"
end
