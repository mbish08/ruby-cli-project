#this file handles all of the API requests
 
class API 
 
 def self.fetch_cities(city)
    url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    binding.pry 

 end 






end 