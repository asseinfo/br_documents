require "spec_helper"

describe IeValidator do
  let(:record) { double("model") }

  before do
    allow(record).to receive(:uf) {"SC"}
    allow(record).to receive(:errors).and_return([])
    allow(record.errors).to receive(:messages).and_return({})
    allow(record.errors).to receive(:add) do | attribute, error |
      record.errors.messages[attribute] = [error]
    end
  end

  subject { IeValidator.new(attributes: "ie", uf: "uf") }

  context "when IE's number is valid" do
    before { subject.validate_each(record, "ie", "253667852") }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context "when IE is blank" do
    before { subject.validate_each(record, "ie", "") }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context "when IE is invalid" do
    before { subject.validate_each(record, "ie", "253667853") }

    it "adds errors in model" do
      expect(record.errors.messages).to_not be_empty
    end
  end

  context "when UF is invalid" do
    before do
      allow(record).to receive(:uf){""}
      subject.validate_each(record, "ie", "253667852")
    end

    it "adds error in model" do
      expect(record.errors.messages["ie"]).to eql [t("validator.ie.uf.invalid")]
    end
  end

  context "when it can't find attribute uf in model" do
    before do
      allow(record).to receive(:uf).and_raise(NoMethodError)
      subject.validate_each(record, "ie", "253667852")
    end

    it "adds error in model" do
      expect(record.errors.messages[:base]).to eql [
        t("validator.ie.uf.no_present", uf: "uf")]
    end
  end

  context "when attribute uf is not defined" do
    subject { IeValidator.new(attributes: "ie") }
    before { subject.validate_each(record, "ie", "253667852") }

    it "adds error in model" do
      expect(record.errors.messages[:base]).to eql [
        t("validator.ie.uf.no_configured")]
    end
  end
end
