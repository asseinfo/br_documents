require "spec_helper"

describe BrDocuments::IE::MT do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = BrDocuments::IE::MT.new("12345678901")
      expect(ie.formatted).to eq "1234567890-1"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["82.060.187.373", "528843171-72", "AD402552219"].each do |number|
        ie = BrDocuments::IE::MT.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 11" do
      ["123456789012", "123456789"].each do |number|
        ie = BrDocuments::IE::MT.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["00404609123", "83646580222"].each do |number|
        ie = BrDocuments::IE::MT.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["00130000019", "82060187373"].each do |number|
        ie = BrDocuments::IE::MT.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
