require "spec_helper"

describe ValidaDocs::IE::GO do
  it "is invalid with malformed number" do
    ["01.390415.9", "280541-600", "1C78150A5"].each do |number|
      ie = ValidaDocs::IE::GO.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 9" do
    ["1234567", "122345678901"].each do |number|
      ie = ValidaDocs::IE::GO.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["903473566", "493184742"].each do |number|
      ie = ValidaDocs::IE::GO.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["155432214", "916876470"].each do |number|
      ie = ValidaDocs::IE::GO.new(number)
      expect(ie).to be_valid
    end
  end
end
