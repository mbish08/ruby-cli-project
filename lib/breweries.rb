#this file is where objects are instantiated, where objects are tracked, and where responses are turned into objects
 
class Breweries 
 
    attr_accessor :id, :name, :brewery_type, :street, :city, :state, :postal_code, :phone, :website_url, :searched_city

    #create a place to store all of the breweries
    @@all = []
    @@some = []

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
    end 

    def self.all
        @@all 
    end 

    def save
        @@all << self
    end 

    def self.find_by(city)
        @@all.find do |b| 
      #      binding.pry 
            b.id == city.values[0]
        end 
    end 

    def self.create(city)
        city = self.new(city)
        city.save  
        city 
    end 

    def self.find_or_create(city)
        find_by(city) || create(city)
    end 
    
    def self.find_by_searched_city(city)
        @@all.find_all { |b| b.searched_city == city }
    end 

    # def self.brewery_count
    #     @@some << @@all.uniq
    #     @@some.count 
    #   #  binding.pry
    # end 
end 