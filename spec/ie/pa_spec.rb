require "spec_helper"

describe BrDocuments::IE::PA do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = BrDocuments::IE::PA.new("123456789")
      expect(ie.formatted).to eq "12-345678-9"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["15.361.802-7", "15-48556-93", "15-4AB752-7"].each do |number|
        ie = BrDocuments::IE::PA.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 9" do
      ["1234567", "12345678901"].each do |number|
        ie = BrDocuments::IE::PA.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["152653852", "157252799"].each do |number|
        ie = BrDocuments::IE::PA.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["159636841", "158667794"].each do |number|
        ie = BrDocuments::IE::PA.new(number)
        expect(ie).to be_valid
      end
    end
  end
end
