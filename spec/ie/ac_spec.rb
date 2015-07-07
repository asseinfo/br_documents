require "spec_helper"
require_relative "shared_examples_for_to_remove_all_masks"

RSpec.describe BrDocuments::IE::AC do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = described_class.new("1234567890123")
      expect(ie.formatted).to eq "12.345.678/901-23"
    end
  end

  describe "#valid?" do
    it "is invalid with malformed number" do
      ["01.448.52/88.91-50", "01.278.704/5555-7", "01.AB7.904/028-50"].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with length different to 13" do
      ["1234567890", "123456789012"].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is invalid with invalid check number" do
      ["0135184641523", "0172567054082"].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it "is valid with valid number" do
      ["0182235562573", "0104754560901"].each do |number|
        ie = described_class.new(number)
        expect(ie).to be_valid
      end
    end

    include_examples "for to remove all masks", "01.047.545/609-01"
  end
end
