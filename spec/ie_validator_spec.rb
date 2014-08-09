require "spec_helper"

describe IeValidator do
  before(:each) do
    @validator = IeValidator.new(attributes: "ie", uf: "uf")
    @mock = double("model")
    allow(@mock).to receive(:uf) {"SC"}
    allow(@mock).to receive(:errors).and_return([])
    allow(@mock.errors).to receive(:messages).and_return({})
    allow(@mock.errors).to receive(:add) do | attribute, error |
      @mock.errors.messages[attribute] = [error]
    end
  end

  subject { @validator }

  context "when IE's number is valid" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "ie", "253667852")
      expect(@mock.errors.messages).to be_empty
    end
  end

  context "when IE is 'ISENTO'" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "ie", "ISENTO")
      expect(@mock.errors.messages).to be_empty
    end
  end  

  context "when IE is blank" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "ie", "")
      expect(@mock.errors.messages).to be_empty
    end
  end

  context "when IE is invalid" do
    it "adds errors in model" do
      subject.validate_each(@mock, "ie", "253667853")
      expect(@mock.errors.messages).to_not be_empty
    end
  end

  context "when UF is invalid" do
    it "adds error in model" do
      allow(@mock).to receive(:uf){""}
      subject.validate_each(@mock, "ie", "253667852")
      expect(@mock.errors.messages["ie"]).to eql [t("validator.ie.uf.invalid")]
    end
  end

  context "when it can't find attribute uf in model" do
    it "adds error in model" do
      allow(@mock).to receive(:uf).and_raise(NoMethodError)
      subject.validate_each(@mock, "ie", "253667852")
      expect(@mock.errors.messages[:base]).to eql [
        t("validator.ie.uf.no_present", uf: "uf")
      ]
    end
  end

  context "when attribute uf is not defined" do
    it "adds error in model" do
      @validator = IeValidator.new(attributes: "ie")
      subject.validate_each(@mock, "ie", "253667852")
      expect(@mock.errors.messages[:base]).to eql [
        t("validator.ie.uf.no_configured")
      ]
    end
  end
end
