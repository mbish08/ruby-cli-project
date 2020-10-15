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
        @city_input = gets.strip.downcase
        while @city_input != "exit"
            puts ""
            API.fetch_cities(@city_input)
            breweries = Breweries.find_by_searched_city(@city_input) 
       #     binding.pry
            print_all_city(breweries)
            puts ""
            puts "If you would like to see more info, type the number of the brewery."
            puts ""
            @selection = gets.strip.to_i 
            until @selection >= 1 
               # binding.pry
                puts "Please type a number from the list."
                @selection = gets.strip.to_i
            end 
            brewery = Breweries.find_by_searched_city(@city_input)[selection.to_i - 1]
            more_info_city(brewery) 
        puts ""
        puts "Type another city to search or type 'exit' to exit."
        puts ""
        @city_input = gets.strip.downcase
        end 
    end 
 
    def print_all_city(brewery) #this method creates the numbered list that the user will see and includes the city/state
        puts "Here are the breweries for city names that match #{@city_input.capitalize}:"
        puts ""
    #    binding.pry
         brewery.each.with_index(1) do | b, i |
    #   #      binding.pry
             puts "#{i}. #{b.name}: #{b.city}, #{b.state}"
        end 
    end 
 
    def more_info_city(brewery) #this method gives the user information on their selected brewery
        puts ""
        puts "Here is the information for your selection:"
        puts ""
       # binding.pry
        puts "Name: #{brewery.name}"
        puts "Address: #{brewery.street}"
        puts "#{brewery.city}, #{brewery.state}, #{brewery.postal_code}"
        puts "Phone: #{brewery.phone}"
        puts "Website: #{brewery.website_url}"
    end 
end 