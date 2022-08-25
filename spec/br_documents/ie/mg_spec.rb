require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

RSpec.describe BrDocuments::IE::MG do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('1234567890123')
      expect(ie.formatted).to eq '123.456.789/0123'
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['363.112.657.12-75', '4.168.836.973-423', '560.139.778.87-12'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with length different to 13' do
      ['123456789', '1234567890123'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['4193434759812', '9427301981832'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is valid with valid number' do
      ['4193434759899', '9427301981820', '0043982240026'].each do |number|
        ie = described_class.new(number)
        expect(ie).to be_valid
      end
    end

    include_examples 'for to remove all masks', '942.730.198/1820'
  end
end
