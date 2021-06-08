require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

fdescribe BrDocuments::IE::PA do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('123456789')
      expect(ie.formatted).to eq '12-345678-9'
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['15.361.802-7', '15-48556-93', '15-4AB752-7'].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it 'is invalid with length different to 9' do
      ['1234567', '12345678901'].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['152653852', '157252799'].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it 'is valid with valid number' do
      ['159636841', '158667794'].each do |number|
        ie = described_class.new(number)
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '15-866779-4'
  end
end
