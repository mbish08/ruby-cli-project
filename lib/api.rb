class API 
 
 def self.fetch_cities(searched_city)
    url = "https://api.openbrewerydb.org/breweries?by_city=#{searched_city}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    breweries = JSON.parse(response)
    #This method creates a numbered list for the user to select from
    #The city and state are included with the brewery name as the city search also returns matches based on partial matches
    breweries.collect do |brewery| 
        Breweries.find_or_create(id: brewery["id"], name: brewery["name"], brewery_type: brewery["brewery_type"], street: brewery["street"], 
        city: brewery["city"], state: brewery["state"], postal_code: brewery["postal_code"], phone: brewery["phone"], 
        website_url: brewery["website_url"], searched_city: searched_city)
    end 
 end
end 