require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

RSpec.describe BrDocuments::IE::BA do
  describe '#formatted' do
    context 'when having 8 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('12345678')
        expect(ie.formatted).to eq '123456-78'
      end
    end

    context 'when having 9 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('123456789')
        expect(ie.formatted).to eq '1234567-89'
      end
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['82.060.187.373', '528843171-72', 'AD402552219'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with length different to 8 or 9' do
      ['1234567', '1234567890'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    context 'when having 8 digits' do
      it 'is invalid with invalid check number' do
        ['12345682', '61934523', '39034325'].each do |number|
          ie = described_class.new(number)
          expect(ie).not_to be_valid
        end
      end

      it 'is valid with valid number' do
        ['123456-63', '61234557'].each do |number|
          ie = described_class.new(number)
          expect(ie).to be_valid
        end
      end
    end

    context 'when having 9 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('100052398')
        expect(ie).not_to be_valid
      end

      it 'is valid with valid number' do
        ['1000003-06', '066.486.527'].each do |number|
          ie = described_class.new(number)
          expect(ie).to be_valid
        end
      end
    end

    include_examples 'for to remove all masks', '1000003-06'
    include_examples 'for to remove all masks', '100.000.306'
  end
end
