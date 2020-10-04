#this file handles all of the API requests
 
class API 
 
 def self.fetch_cities(city)
    url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    breweries = JSON.parse(response)
    #time to create a list of breweries for selected city
    #this will allow me to create a numbered list for the user to select from
    #I am including the city and state with the brewery name as the city search also returns matches based on partial matches
    breweries.each do |brewery| 
        Breweries.new(name: brewery["name"], brewery_type: brewery["brewery_type"], street: brewery["street"], 
        city: brewery["city"], state: brewery["state"], postal_code: brewery["postal_code"], phone: brewery["phone"], 
        website_url: brewery["website_url"])
    end 
 end 
 
 def self.fetch_states(state)
    url = "https://api.openbrewerydb.org/breweries?by_state=#{state}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    breweries = JSON.parse(response)
    breweries.each do |brewery| 
        Breweries.new(name: brewery["name"], brewery_type: brewery["brewery_type"], street: brewery["street"], 
        city: brewery["city"], state: brewery["state"], postal_code: brewery["postal_code"], phone: brewery["phone"], 
        website_url: brewery["website_url"])
    end 
 end 

 

end 