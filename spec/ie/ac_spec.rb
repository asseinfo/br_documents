require "spec_helper"

describe ValidaDocs::IE::AC do
  it "is invalid with malformed number" do
    ["01.448.52/88.91-50", "01.278.704/5555-7", "01.AB7.904/028-50"].each do |number|
      ie = ValidaDocs::IE::AC.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 13" do
    ["1234567890", "123456789012"].each do |number|
      ie = ValidaDocs::IE::AC.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["0135184641523", "0172567054082"].each do |number|
      ie = ValidaDocs::IE::AC.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["0182235562573", "0104754560901"].each do |number|
      ie = ValidaDocs::IE::AC.new(number)
      expect(ie).to be_valid
    end
  end
end
