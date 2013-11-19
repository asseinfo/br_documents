require "spec_helper"

describe ValidaDocs::IE::RN do
  it "is invalid with malformed number" do
    ["9.012.207-95", "617.964.80-7", "25.9AB.924-6"].each do |number|
      ie = ValidaDocs::IE::RN.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 9 or 10" do
    ["12345678", "12345678901"].each do |number|
      ie = ValidaDocs::IE::RN.new(number)
      expect(ie).to_not be_valid
    end
  end

  context "when having 9 digits" do
    it "is invalid with invalid check number" do
      ie = ValidaDocs::IE::RN.new("794050643")
      expect(ie).to_not be_valid
    end

    it "is valid with valid number" do
      ie = ValidaDocs::IE::RN.new("200400401")
      expect(ie).to be_valid
    end
  end

  context "when having 10 digits" do
    it "is invalid with invalid check number" do
      ie = ValidaDocs::IE::RN.new("1153296142")
      expect(ie).to_not be_valid
    end

    it "is valid with valid number" do
      ie = ValidaDocs::IE::RN.new("2000400400")
      expect(ie).to be_valid
    end
  end
end
