require "spec_helper"

describe SuframaValidator do
  let(:mock) { double("model") }

  before do
    allow(@mock).to receive(:errors).and_return([])
    allow(@mock.errors).to receive(:messages).and_return({})
    allow(@mock.errors).to receive(:add) do | attribute, error |
       @mock.errors.messages[attribute] = [error]
    end
  end

  subject { SuframaValidator.new(attributes: "cpf").new }

  context "when Cpf is valid" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "cpf", "01233254120")
      expect(@mock.errors.messages).to be_empty
    end
  end

  context "when Cpf is blank" do
    it "doesn't add errors in model" do
      subject.validate_each(@mock, "cpf", "")
      expect(@mock.errors.messages).to be_empty
    end
  end

  context "when Cpf is invalid" do
    it "adds errors in model" do
      subject.validate_each(@mock, "cpf", "01233254121")
      expect(@mock.errors.messages).to_not be_empty
    end
  end
end
