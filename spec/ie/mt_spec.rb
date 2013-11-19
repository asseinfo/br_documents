require "spec_helper"

describe ValidaDocs::IE::MT do
  it "is invalid with malformed number" do
    ["82.060.187.373", "528843171-72", "AD402552219"].each do |number|
      ie = ValidaDocs::IE::MT.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 11" do
    ["123456789012", "123456789"].each do |number|
      ie = ValidaDocs::IE::MT.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["00404609123", "83646580222"].each do |number|
      ie = ValidaDocs::IE::MT.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["00130000019", "82060187373"].each do |number|
      ie = ValidaDocs::IE::MT.new(number)
      expect(ie).to be_valid
    end
  end
end
