require "spec_helper"

describe ValidaDocs::IE::BA do

  it "is invalid with malformed number" do
    ["82.060.187.373", "528843171-72", "AD402552219"].each do |number|
      ie = ValidaDocs::IE::BA.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 8 or 9" do
    ["1234567", "1234567890"].each do |number|
      ie = ValidaDocs::IE::BA.new(number)
      expect(ie).to_not be_valid
    end
  end

  context "when having 8 digits" do
    it "is invalid with invalid check number" do
      ["12345682", "61934523", "39034325"].each do |number|
        ie = ValidaDocs::IE::BA.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["12345663", "61234557"].each do |number|
        ie = ValidaDocs::IE::BA.new(number)
        expect(ie).to be_valid
      end
    end
  end

  context "when having 9 digits" do
    it "is invalid with invalid check number" do
      ie = ValidaDocs::IE::BA.new("100052398")
      expect(ie).to_not be_valid
    end

    it "is valid with valid number" do
      ie = ValidaDocs::IE::BA.new("100000306")
      expect(ie).to be_valid
    end
  end
end
