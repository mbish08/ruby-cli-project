#this file is where objects are instantiated, where objects are tracked, and where responses are turned into objects
 
class Breweries 
 
    attr_accessor :name, :brewery_type, :street, :city, :state, :postal_code, :phone, :website_url

    #create a place to store all of the breweries
    @@all = []

    #Breweries.new from API class comes here
    def initialize(name:, brewery_type:, street:, city:, state:, postal_code:, phone:, website_url:)
        @name = name
        @brewery_type = brewery_type
        @street = street
        @city = city
        @state = state
        @postal_code = postal_code
        @phone = phone
        @website_url = website_url
        @@all << self 
    end 

    #I need to be able to display @@all when it is called in CLI class
    def self.all
        @@all 
    end 

    

  #  binding.pry
#   "name": "Deadwood Brewery / Boston Bowl",
#     "brewery_type": "brewpub",
#     "street": "820 William T Morrissey Blvd",
#     "city": "Boston",
#     "state": "Massachusetts",
#     "postal_code": "02122-3404",
#     "country": "United States",
#     "longitude": "-71.047997482376",
#     "latitude": "42.2948560502166",
#     "phone": "6177401440",
#     "website_url": "http://www.deadwoodbrewery.com",

end 