require 'unirest'

screen_size = 70

system "clear"

puts #puts without anything in it will put a blank line
puts "Weather Brought to You by the Best".center(screen_size) #creates a string that is (x) characters long, and puts even empty space on both sides of string to fill up the given vaule
puts "=" * screen_size
puts


print " " * 15 + "Enter a City: "   #print gets rid of the "" from p
city = gets.chomp

print " " * 15 + "Enter a State: "   #print gets rid of the "" from p
state = gets.chomp

puts
puts
puts ("-" * (screen_size - 10)).center(screen_size)

response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

channel = response.body["query"]["results"]["channel"]
temp_unit = channel["units"]["temperature"]
loaction_city = channel["location"]["city"]
location_state = channel["location"]["region"]

temperature = channel["item"]["condition"]["temp"]
condition = channel["item"]["condition"]["text"]

puts "Today in #{loaction_city},#{location_state}, it is #{temperature}#{temp_unit} out today and #{condition}".center(screen_size)

puts ("=" * screen_size)