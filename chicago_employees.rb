require "unirest"   #gets unirest running

response = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")  #turns the data from the website into something that it can use
employees = response.body

employees.each do |employee|
  puts "Name: #{employee['name']}"
  puts "Job Title: #{employee['job_titles']}"
  puts "-" * 50
end

puts "i can't come out to play"
