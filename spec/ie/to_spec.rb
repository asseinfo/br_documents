require "spec_helper"

describe ValidaDocs::IE::TO do
  it "is invalid with malformed number" do
    ["2.903.593.362-3", "29.02.79268-45", "29.02.5AB420-5"].each do |number|
      ie = ValidaDocs::IE::TO.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 11" do
    ["12345678", "123456789012"].each do |number|
      ie = ValidaDocs::IE::TO.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["29023864406", "29023864409"].each do |number|
      ie = ValidaDocs::IE::TO.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["29992001436", "29992317417"].each do |number|
      ie = ValidaDocs::IE::TO.new(number)
      expect(ie).to be_valid
    end
  end
end
