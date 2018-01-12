require 'unirest'
system 'clear'
puts "Which reddit article number would you like to see the comments for?"
art_num = gets.chomp

reddit_response = Unirest.get("https://www.reddit.com/r/programming/.json")

reddit = reddit_response.body

comment_url = "https://www.reddit.com" + reddit["data"]["children"][(art_num.to_i)]["data"]["permalink"]
print comment_url

comments = Unirest.get("#{comment_url}")
print comments

# p reddit["data"]["children"][(art_num.to_i)]




  # the comments are stored in a different api, which will have to change depending on which article the user wants to look at