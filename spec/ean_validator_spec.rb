require "spec_helper"

describe EanValidator do
  let(:record) { double("model") }

  before do
    allow(record).to receive(:errors).and_return([])
    allow(record.errors).to receive(:messages).and_return({})
    allow(record.errors).to receive(:add) do | attribute, error |
      record.errors.messages[attribute] = [error]
    end
  end

  subject { EanValidator.new(attributes: "ean") }

  context "when EAN code is valid" do
    before { subject.validate_each(record, "ean", "1243658721548") }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context "when EAN is blank" do
    before { subject.validate_each(record, "ean", "") }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context "when EAN is nil" do
    before { subject.validate_each(record, "ean", nil) }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context "when EAN is invalid" do
    before { subject.validate_each(record, "ean", "253667853") }

    it "adds errors in model" do
      expect(record.errors.messages).to include 'ean' => [:invalid]
    end
  end
end
