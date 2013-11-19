require "spec_helper"

describe ValidaDocs::IE::AP do
  it "is invalid with length different to 9" do
    ["1234567", "123456789012"].each do |number|
      ie = ValidaDocs::IE::AP.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["030123456", "030182454"].each do |number|
      ie = ValidaDocs::IE::AP.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["030123459", "030183458", "030213452"].each do |number|
      ie = ValidaDocs::IE::AP.new(number)
      expect(ie).to be_valid
    end
  end
end
