require "spec_helper"
require_relative "shared_examples_for_pattern1"

describe ValidaDocs::IE::MS do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = ValidaDocs::IE::MS.new("123456789")
      expect(ie.formatted).to eq "123456789"
    end
  end

  it_behaves_like "a pattern1", "MS"
end
