require "spec_helper"

describe ValidaDocs::IE::SP do
  it "is invalid with malformed number" do
    ["36.9107.395114", "527.08212.8110"].each do |number|
      ie = ValidaDocs::IE::SP.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["110042490113", "110.042.491.114", "P-01100424.4/002"].each do |number|
      ie = ValidaDocs::IE::SP.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["110042490114", "110.042.490.114", "P-01100424.3/002"].each do |number|
      ie = ValidaDocs::IE::SP.new(number)
      expect(ie).to be_valid
    end
  end
end
