require "spec_helper"

describe ValidaDocs::IE::RS do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = ValidaDocs::IE::RS.new("1234567890")
      expect(ie.formatted).to eq "123/4567890"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ie = ValidaDocs::IE::RS.new("17/70169293")
      expect(ie).to_not be_valid
    end

    it "is invalid with length different to 10" do
      ["123456789", "12345678901"].each do |number|
        ie = ValidaDocs::IE::RS.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["1770169292", "034/0112114"].each do |number|
        ie = ValidaDocs::IE::RS.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["1770169293", "034/0112115"].each do |number|
        ie = ValidaDocs::IE::RS.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
