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

    context "when the number is greater than 11" do
      subject { BrDocuments::IE::MT.new("123456789012") }

      it "is invalid " do
        expect(subject).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["00404609123", "83646580222"].each do |number|
        ie = BrDocuments::IE::MT.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["0013000001-9", "82060187373", "132631946", "13.263.194-6"].each do |number|
        ie = BrDocuments::IE::MT.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
