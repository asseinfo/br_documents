require "spec_helper"

describe ValidaDocs::IE::AL do
  it "is invalid with length different to 9" do
    ["1234567", "122345678901"].each do |number|
      ie = ValidaDocs::IE::AL.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["245320152", "240046248"].each do |number|
      ie = ValidaDocs::IE::AL.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["247975494", "248466313"].each do |number|
      ie = ValidaDocs::IE::AL.new(number)
      expect(ie).to be_valid
    end
  end
end
