#this file is where objects are instantiated, where objects are tracked, and where responses are turned into objects
 
class Breweries 
 
    attr_accessor :id, :name, :brewery_type, :street, :city, :state, :postal_code, :phone, :website_url, :searched_city

    #create a place to store all of the breweries
    @@all = []

    #Breweries.new from API class comes here
    def initialize(id:, name:, brewery_type:, street:, city:, state:, postal_code:, phone:, website_url:, searched_city:)
        @id = id
        @name = name
        @brewery_type = brewery_type
        @street = street
        @city = city
        @state = state
        @postal_code = postal_code
        @phone = phone
        @website_url = website_url
        @searched_city = searched_city
        @@all << self 
    end 

    #I need to be able to display @@all when it is called in CLI class
    def self.all
        @@all 
    end 
    
    def self.find_by_searched_city(city)
        @@all.uniq do |b| 
            b.id
        end 
    end 
end 