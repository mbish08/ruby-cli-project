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
        @selection = gets.strip.downcase.to_i - 1
        if self.selection != "exit" 
            more_info(breweries) 

        end 

    end 
 
    def print_all(brewery) #this method creates the numbered list that the user will see and includes the city/state
        puts "Here are the breweries for city names that match #{@city.capitalize}:"
        puts ""
        brewery.each_with_index do | b, i |
            puts "#{i+1}. #{b.name}: #{b.city}, #{b.state}"
        end 
    end 
 
    def more_info(brewery)
        puts "Here is the information for your selection:"
        puts "Name: #{brewery[selection].name}"
        puts "Address: #{brewery[selection].street}"
        puts "#{brewery[selection].city}, #{brewery[selection].state}, #{brewery[selection].postal_code}"
        puts "Phone: #{brewery[selection].phone}"
        puts "Website: #{brewery[selection].website_url}"
        
       # binding.pry 
        # brewery[1].name will equal the name


    end 
 
end
