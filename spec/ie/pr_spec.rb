require "spec_helper"

describe ValidaDocs::IE::PR do
  it "is invalid with malformed number" do
    ["1016323-850", "10163238.50"].each do |number|
      ie = ValidaDocs::IE::PR.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["10163238-51", "10163238-40"].each do |number|
      ie = ValidaDocs::IE::PR.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["1016323850", "10163238-50"].each do |number|
      ie = ValidaDocs::IE::PR.new(number)
      expect(ie).to be_valid
    end
  end
end
