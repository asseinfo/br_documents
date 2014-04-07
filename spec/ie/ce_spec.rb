require "spec_helper"
require_relative "shared_examples_for_pattern1"

describe ValidaDocs::IE::CE do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = ValidaDocs::IE::CE.new("123456789")
      expect(ie.formatted).to eq "12345678-9"
    end
  end

  it_behaves_like "a pattern1", "CE"
end
