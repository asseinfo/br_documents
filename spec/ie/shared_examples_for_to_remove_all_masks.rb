require "spec_helper"

shared_examples "for to remove all masks" do |valid_number_with_mask|
  describe "#valid?" do
    context "when the number is valid" do
      subject { described_class.new(valid_number_with_mask) }

      it "removes the mask" do
        expect(subject).to be_valid

        only_numbers = valid_number_with_mask.gsub(/[\.\/-]/, "")
        expect(valid_number_with_mask).to eq only_numbers
      end
    end
  end
end
