require "spec_helper"

describe BrDocuments::Ean do
  describe "#valid?" do
    it "is invalid with length different to 8, 13 and 14" do
      ["123456189", "114567854871"].each do |code|
        ean = described_class.new(code)
        expect(ean).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["12345611", "1145678548712", "1234567891127"].each do |number|
        ean = described_class.new(number)
        expect(ean).to_not be_valid
      end
    end

    it "is valid with valid code" do
      ["12345618", "1145678548719", "1234567891125"].each do |number|
        ean = described_class.new(number)
        expect(ean).to be_valid
      end
    end
  end
end
