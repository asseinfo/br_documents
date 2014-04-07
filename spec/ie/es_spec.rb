require "spec_helper"
require_relative "shared_examples_for_pattern1"

describe BrDocuments::IE::ES do
  describe "#formatted" do
    it "returns a formatted ie" do
      ie = BrDocuments::IE::ES.new("123456789")
      expect(ie.formatted).to eq "123456789"
    end
  end

  it_behaves_like "a pattern1", "ES"
end