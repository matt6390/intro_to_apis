require 'unirest'
system 'clear'
puts "Please Enter a Word:".center(80)
print "=" * 80
puts
input_word = gets.chomp
puts


definition = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

top_example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

pronounce = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
")


print "The definition of '#{input_word}' is: "
puts definition.body[0]["text"]
puts
print "=" * 80
puts

puts
print "The top example of '#{input_word}' is: "
puts top_example.body["text"]
puts
print "=" * 80
puts

puts
print "The pronounciation of '#{input_word}' is: "
puts pronounce.body[0]["raw"]
puts

