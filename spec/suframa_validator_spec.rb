require "spec_helper"

describe SuframaValidator do
  before(:each) do
    @validator = SuframaValidator.new(attributes: "suframa")
    @mock = double("model")
    allow(@mock).to receive(:errors).and_return([])
    allow(@mock.errors).to receive(:messages).and_return({})
    allow(@mock.errors).to receive(:add) do |attribute, error|
       @mock.errors.messages[attribute] = [error]
    end
  end

  subject { @validator }

  context "when SUFRAMA is valid" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "suframa", "600215105")
      expect(@mock.errors.messages).to be_empty
    end
  end

  context "when SUFRAMA is blank" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "suframa", "")
      expect(@mock.errors.messages).to be_empty
    end
  end

  context "when SUFRAMA is invalid" do
    it "adds errors in model" do
      subject.validate_each(@mock, "suframa", "01233254121")
      expect(@mock.errors.messages).to_not be_empty
    end
  end
end
