#this file is where objects are instantiated, where objects are tracked, and where responses are turned into objects
 
class Breweries 
 
    attr_accessor :name, :city, :state

    #create a place to store all of the breweries
    @@all = []

    #Breweries.new from API class comes here
    def initialize(name:, city:, state:)
        @name = name
        @city = city
        @state = state
        @@all << self 
    end 

    #I need to be able to display @@all when it is called in CLI class
    def self.all
        @@all 
    end 

  #  binding.pry

end 