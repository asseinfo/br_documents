require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

describe BrDocuments::IE::RN do
  describe '#formatted' do
    context 'when having 9 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('123456789')
        expect(ie.formatted).to eq '12.345.678-9'
      end
    end

    context 'when having 10 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('1234567890')
        expect(ie.formatted).to eq '12.3.456.789-0'
      end
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['9.012.207-95', '617.964.80-7', '25.9AB.924-6'].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    it 'is invalid with length different to 9 or 10' do
      ['12345678', '12345678901'].each do |number|
        ie = described_class.new(number)
        expect(ie).to_not be_valid
      end
    end

    context 'when having 9 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('794050643')
        expect(ie).to_not be_valid
      end

      it 'is valid with valid number' do
        ie = described_class.new('200400401')
        expect(ie).to be_valid
      end
    end

    context 'when having 10 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('1153296142')
        expect(ie).to_not be_valid
      end

      it 'is valid with valid number' do
        ie = described_class.new('2000400400')
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '20.0.040.040-0'
  end
end
