require "spec_helper"

describe ValidaDocs::IE::MG do
  it "is invalid with malformed number" do
    ["36.311.266.571-75", "4.168.836.973-423", "560.139.778.87-BA"].each do |number|
      ie = ValidaDocs::IE::MG.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 13" do
    ["123456789", "1234567890123"].each do |number|
      ie = ValidaDocs::IE::MG.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["4193434759812", "9427301981832"].each do |number|
      ie = ValidaDocs::IE::MG.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["4193434759899", "9427301981820"].each do |number|
      ie = ValidaDocs::IE::MG.new(number)
      expect(ie).to be_valid
    end
  end
end
