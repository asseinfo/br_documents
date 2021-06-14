require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

describe BrDocuments::IE::PR do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('1234567890')
      expect(ie.formatted).to eq '12345678-90'
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['1016323-850', '10163238.50'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['10163238-51', '10163238-40'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is valid with valid number' do
      ['1016323850', '10163238-50'].each do |number|
        ie = described_class.new(number)
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '10163238-50'
  end
end
