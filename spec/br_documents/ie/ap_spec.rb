require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

RSpec.describe BrDocuments::IE::AP do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('123456789')
      expect(ie.formatted).to eq '123456789'
    end
  end

  describe '#valid?' do
    it 'is invalid with length different to 9' do
      ['12345678', '1234567890'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['030123456', '030182454', '000000000'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is valid with valid number' do
      first_range_number = '030123459'
      ie = described_class.new(first_range_number)
      expect(ie).to be_valid

      second_range_number = '030183458'
      ie = described_class.new(second_range_number)
      expect(ie).to be_valid

      third_range_number = '030192455'
      ie = described_class.new(third_range_number)
      expect(ie).to be_valid
    end

    include_examples 'for to remove all masks', '030213452'
  end
end
