require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

describe BrDocuments::IE::RO do
  describe '#formatted' do
    context 'when having 9 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('123456789')
        expect(ie.formatted).to eq '123.45678-9'
      end
    end

    context 'when having 14 digits' do
      it 'returns a formatted ie' do
        ie = described_class.new('12345678901234')
        expect(ie.formatted).to eq '1234567890123-4'
      end
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['20.049.788-6', '2.004.978-86', '937.03AB1-6'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with length different to 9 or 14' do
      ['1234567', '123456789012', '12345678901234567'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    context 'when having 9 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('134725252')
        expect(ie).not_to be_valid
      end

      it 'is valid with valid number' do
        ie = described_class.new('101625213')
        expect(ie).to be_valid
      end
    end

    context 'when having 14 digits' do
      it 'is invalid with invalid check number' do
        ie = described_class.new('02539835229263')
        expect(ie).not_to be_valid
      end

      it 'is valid with valid number' do
        ie = described_class.new('00000003497861')
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '0000000062521-3'
  end
end
