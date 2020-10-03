#this file is for interactions with the user
#contains all of the gets and puts
 
class CLI 
 
    def start 
        #start with greeting
        puts ""
        puts "Welcome to Brewery Finder!"
        puts ""
        #ask user to indicate if they would like to search by city or state
        puts ""
        puts "Search for breweries by entering a city name."
        puts ""
        @city = gets.strip.downcase 
        puts ""
        API.fetch_cities(@city)




    end 
 
 
end
