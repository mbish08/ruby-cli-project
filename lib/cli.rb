class CLI 

    attr_accessor :selection 
 
    def start 
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
            while API.fetch_cities(@city_input) == []
                puts ""
                puts "Your search didn't return any results."
                puts ""
                puts "Please try another city."
                puts ""
                @city_input = gets.strip.downcase
            end 
            breweries = Breweries.find_by_searched_city(@city_input)
            print_all_city(breweries)
            puts ""
            puts "If you would like to see more info, type the number of the brewery."
            puts ""
            @selection = gets.strip.to_i 
            until @selection >= 1 && @selection <= Breweries.all.count
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
         brewery.each.with_index(1) do | b, i |
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