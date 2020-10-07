#this file is for interactions with the user
#contains all of the gets and puts
 
class CLI 

    attr_accessor :selection 
 
    def start 
        #start with greeting
        puts ""
        puts ".~~~~."
        puts "i====i_"
        puts "|cccc|_)"
        puts "|cccc|"   
        puts "`-==-"
        puts "Welcome to Brewery Finder!"
        puts ""
        puts "What city would you like to search for breweries?"
        puts ""
        @city = gets.strip.downcase
        while @city != "exit"
            puts ""
            API.fetch_cities(@city)
            breweries = Breweries.find_by_searched_city(@city) 
            print_all_city(breweries)
            puts ""
            puts "If you would like to see more info, type the number of the brewery."
            puts ""
            @selection = gets.strip
            #START HERE - need to figure out how to get out of the loop and have exit work...
            if @selection
            brewery = Breweries.find_by_searched_city(@city)[selection.to_i - 1]
            more_info_city(brewery) 
            end 
        puts ""
        puts "Type another city to search or type 'exit' to exit."
        puts ""
        @city = gets.strip.downcase
        end 
    end 
 
    def print_all_city(brewery) #this method creates the numbered list that the user will see and includes the city/state
        puts "Here are the breweries for city names that match #{@city.capitalize}:"
        puts ""
        brewery.each.with_index(1).uniq do | b, i |
            puts "#{i}. #{b.name}: #{b.city}, #{b.state}"
        end 
    end 
 
    def more_info_city(brewery) #this method gives the user information on their selected brewery
        puts ""
        puts "Here is the information for your selection:"
        puts ""
        puts "Name: #{brewery.name}"
        puts "Address: #{brewery.street}"
        puts "#{brewery.city}, #{brewery.state}, #{brewery.postal_code}"
        puts "Phone: #{brewery.phone}"
        puts "Website: #{brewery.website_url}"
    end 
end 