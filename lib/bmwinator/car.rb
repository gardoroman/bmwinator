require 'faraday'
require 'json'

API_URL = "http://www.bensbenzes.com/api/v1/cars/active"

module Bmwinator
  class Car

    attr_reader :id, :make, :model, :year, :color, :vin, :dealer_id

    def initialize(attributes)
      @id =  attributes["id"]
      @make = attributes["make"]
      @model = attributes["model"]
      @year = attributes["year"]
      @color = attributes["color"]
      @vin = attributes["vin"]
      @dealer_id = attributes["dealer_id"]
    end

    def self.find(id)
      puts "\n\n*************"
      response = Faraday.get("#{API_URL}/#{id}")
      puts "response is #{response}"
      attributes = JSON.parse(response.body)
      json_attribs = JSON.generate(response.body)
      puts "will json work #{json_attribs}"
      puts "self is #{self}"
      new(attributes)
    end
  end
end
