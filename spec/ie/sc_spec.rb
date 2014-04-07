require "spec_helper"

describe BrDocuments::IE::SC do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = BrDocuments::IE::SC.new("123456789")
      expect(ie.formatted).to eq "123.456.789"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["253.66.7852", "25.4062.407", "A12345678"].each do |number|
        ie = BrDocuments::IE::SC.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 9" do
      ["1234567890", "12345678"].each do |number|
        ie = BrDocuments::IE::SC.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["253667853", "254.062.408"].each do |number|
        ie = BrDocuments::IE::SC.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["253667852", "254.062.407"].each do |number|
        ie = BrDocuments::IE::SC.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
