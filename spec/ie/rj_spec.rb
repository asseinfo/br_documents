require "spec_helper"

describe BrDocuments::IE::RJ do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = BrDocuments::IE::RJ.new("12345678")
      expect(ie.formatted).to eq "12.345.67-8"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["00.55.55.25", "34.09.25-08", "0A220C18"].each do |number|
        ie = BrDocuments::IE::RJ.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 8" do
      ["1234567890", "12345"].each do |number|
        ie = BrDocuments::IE::RJ.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["99228676", "48388923"].each do |number|
        ie = BrDocuments::IE::RJ.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["80172010", "31.864.95-0", "85.994.964"].each do |number|
        ie = BrDocuments::IE::RJ.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
