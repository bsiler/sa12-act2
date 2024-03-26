require "httparty"

area = "Europe"
location = "London"
response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
body = JSON.parse(response.body)

datetime = body["datetime"]
date = datetime.match(/\d{4}-\d{2}-\d{2}/)
time = datetime.match(/(?<=T)\d{2}:\d{2}:\d{2}/)

puts "The current time in #{area}/#{location} is #{date} #{time}"
