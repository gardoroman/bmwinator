require "spec_helper"

describe Bmwinator::Car do

  # let(:car){Bmwinator::Car.new}

  # it "should exist" do
  #   car = Bmwinator::Car.new
  #   expect(car).to be_a(Bmwinator::Car)
  # end

  it "should return a single car" do
    VCR.use_cassette('one_car') do
      car = Bmwinator::Car.find(68)
      expect(car.id).to eq(68)
      expect(car.make).to eq("Honda")
      expect(car.model).to eq("Civic")
      expect(car.year).to eq("1996")
      expect(car.color).to eq("Blue")
      expect(car.vin).to eq("XXXXXXXXXXXXXX")
      expect(car.dealer_id).to eq(34)
    end
  end

end  # end describe Bmwinator
