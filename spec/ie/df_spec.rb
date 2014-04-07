require "spec_helper"

describe ValidaDocs::IE::DF do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = ValidaDocs::IE::DF.new("1234567890123")
      expect(ie.formatted).to eq "12345678901-23"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["070648022871-3", "07.064.802.287-13", "0AB49871799-12"].each do |number|
        ie = ValidaDocs::IE::DF.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 13" do
      ["1234567890", "123456789012345"].each do |number|
        ie = ValidaDocs::IE::DF.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["0733002219945", "0733002219943"].each do |number|
        ie = ValidaDocs::IE::DF.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["0746069399231", "0784748156211"].each do |number|
        ie = ValidaDocs::IE::DF.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
