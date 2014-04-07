require "spec_helper"

describe BrDocuments::IE::RR do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = BrDocuments::IE::RR.new("123456789")
      expect(ie.formatted).to eq "12345678-9"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["24.410.109-5", "2456128-32", "24AB0559-6"].each do |number|
        ie = BrDocuments::IE::RR.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 9" do
      ["1234567", "123456789"].each do |number|
        ie = BrDocuments::IE::RR.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["242131962", "247318099"].each do |number|
        ie = BrDocuments::IE::RR.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["241432573", "240886456"].each do |number|
        ie = BrDocuments::IE::RR.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
