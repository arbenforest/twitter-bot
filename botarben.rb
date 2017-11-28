require 'rubygems'
require 'twitter'
require 'json'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end
 promotion = {
		"photo" => "/home/arben/Bureau/images.jpeg",
  		"text" => "Vous pouvez utiliser ce code pour avoir des hotels en partenariat avec la SNCF APPAGV5"
  	}


client.search("SNCF").take(100).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
      users = []
      users.push(tweet.user.id)
      puts tweet
      client.favorite(tweet)
      client.update_with_media("@#{tweet.user.screen_name} " + promotion["text"], open(promotion["photo"]), {})

end
