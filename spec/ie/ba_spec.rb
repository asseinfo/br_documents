require "spec_helper"

describe BrDocuments::IE::BA do
  describe "#formatted" do
    context "when having 8 digits" do
      it "returns a formatted ie" do
        ie = BrDocuments::IE::BA.new("12345678")
        expect(ie.formatted).to eq "123456-78"
      end
    end

    context "when having 9 digits" do
      it "returns a formatted ie" do
        ie = BrDocuments::IE::BA.new("123456789")
        expect(ie.formatted).to eq "1234567-89"
      end
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["82.060.187.373", "528843171-72", "AD402552219"].each do |number|
        ie = BrDocuments::IE::BA.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 8 or 9" do
      ["1234567", "1234567890"].each do |number|
        ie = BrDocuments::IE::BA.new(number)
        expect(ie).to_not be_valid
      end
    end

    context "when having 8 digits" do
      it "is invalid with invalid check number" do
        ["12345682", "61934523", "39034325"].each do |number|
          ie = BrDocuments::IE::BA.new(number)
          expect(ie).to_not be_valid
        end
      end

      it "is valid with valid number" do
        ["12345663", "61234557"].each do |number|
          ie = BrDocuments::IE::BA.new(number)
          expect(ie).to be_valid
        end
      end
    end

    context "when having 9 digits" do
      it "is invalid with invalid check number" do
        ie = BrDocuments::IE::BA.new("100052398")
        expect(ie).to_not be_valid
      end

      it "is valid with valid number" do
        ie = BrDocuments::IE::BA.new("100000306")
        expect(ie).to be_valid
      end
    end
  end
end
