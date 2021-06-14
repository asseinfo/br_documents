require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

RSpec.describe BrDocuments::IE::MT do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('12345678901')
      expect(ie.formatted).to eq '1234567890-1'
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['82.060.187.373', '528843171-72', 'AD402552219'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    context 'when the number is greater than 11' do
      subject { described_class.new('123456789012') }

      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['00404609123', '83646580222'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is valid with valid number' do
      ['0013000001-9', '82060187373', '132631946', '13.263.194-6'].each do |number|
        ie = described_class.new(number)
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '0013000001-9'
  end
end
