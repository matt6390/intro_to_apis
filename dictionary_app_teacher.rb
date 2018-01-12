require 'unirest'
system 'clear'

looking_up_words = true
while looking_up_words
  
  puts "Please Enter a Word:".center(80)
  print "=" * 80
  puts
  input_word = gets.chomp

    definition_reponse = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/  definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    defins = definition_reponse.body
    
    # puts "DEFINITIONS"
    # puts "-" * 40
    # defins.each.with_index do |definitions, index|
    #   puts "#{index + 1}. #{defins[definitions]["text"]}"
    #   end
    
    
    # puts
    # puts
    
    top_example_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    
    top_example = top_example_response.body
    
    puts "TOP EXAMPLE"
    puts "-" * 40
    puts top_example["text"]
    puts
    puts
    
    pronunce_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
    ")
    
    pronunce = pronunce_response.body
    
    puts "PRONUNCIATION"
    puts "-" * 40
    
    first_pronunciation = pronunce[0]
    if first_pronunciation
      puts first_pronunciation["raw"]
      end

      puts

  if input_word == "q"
    looking_up_words = false
  end
end  

