require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

describe BrDocuments::IE::PE do
  describe '#formatted' do
    context 'when having 9 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('123456789')
        expect(ie.formatted).to eq '1234567-89'
      end
    end

    context 'when having 14 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('18100100000049')
        expect(ie.formatted).to eq '18.1.001.0000004-9'
      end
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['15711188-1', '3.661.165-41', '3AB8287-00', '18.1.001.000000-49'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with length different to 9 or 14' do
      ['1234567', '12345678901', '0123456789012345'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    context 'when having 9 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('838872602')
        expect(ie).not_to be_valid
      end

      it 'is valid with valid number' do
        ie = described_class.new('418873607')
        expect(ie).to be_valid
      end
    end

    context 'when having 14 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('18100100000048')
        expect(ie).not_to be_valid
      end

      it 'is valid with valid number' do
        ie = described_class.new('18100100000049')
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '18.1.001.0000004-9'
  end
end
