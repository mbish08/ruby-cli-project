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
        #ask user to indicate if they would like to search by city or state
        puts ""
        puts "Search for breweries by entering a city name."
        puts ""
        @city = gets.strip.downcase 
        puts ""
        API.fetch_cities(@city)
        breweries = Breweries.all 
        print_all(breweries)
        puts ""
        puts "If you would like to see more info, type the number of the brewery."
        puts "Type 'exit' to exit the search."
        puts ""
        @selection = gets.strip
        if self.selection != "exit" 
            more_info(breweries) 
          #  binding.pry
        else
            puts ""
            puts ".~~~~."
            puts "i====i_"
            puts "|cccc|_)"
            puts "|cccc|"   
            puts "`-==-"
            puts "Cheers!"
            puts ""
        end 
    end 
 
    def print_all(brewery) #this method creates the numbered list that the user will see and includes the city/state
        puts "Here are the breweries for city names that match #{@city.capitalize}:"
        puts ""
        brewery.each.with_index(1) do | b, i |
            puts "#{i}. #{b.name}: #{b.city}, #{b.state}"
        end 
    end 
 
    def more_info(brewery) #this method gives the user information on their selected brewery
        puts "Here is the information for your selection:"
        puts "Name: #{brewery[selection.to_i - 1].name}"
        puts "Address: #{brewery[selection.to_i - 1].street}"
        puts "#{brewery[selection.to_i - 1].city}, #{brewery[selection.to_i - 1].state}, #{brewery[selection.to_i - 1].postal_code}"
        puts "Phone: #{brewery[selection.to_i - 1].phone}"
        puts "Website: #{brewery[selection.to_i - 1].website_url}"
    end 
 
end
