require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

RSpec.describe BrDocuments::IE::MG do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('1234567890123')
      expect(ie.formatted).to eq '123.456.789/0123'
    end

    it 'formats short numbers without leading zeros' do
      ie = described_class.new('4056384072')
      expect(ie.formatted).to eql '405.638.407/2'

      ie = described_class.new('40563840072')
      expect(ie.formatted).to eql '405.638.400/72'
    end

    it 'does not format numbers with less than 10 digits' do
      ie = described_class.new('405638472')
      expect(ie.formatted).to eql '405638472'
    end
  end

  describe '#valid?' do
    it 'is invalid with less than 3 digits' do
      ['1', '12'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with malformed number' do
      ['363.112.657.12-75', '4.168.836.973-423', '560.139.778.87-12'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['123456789', '1234567890123', '4193434759812', '9427301981832'].each do |number|
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

    it 'is valid with less than 13 digits' do
      ie = described_class.new('40563840072')
      expect(ie).to be_valid

      ie = described_class.new('183')
      expect(ie).to be_valid
    end

    it 'is valid with masked number' do
      ie = described_class.new('942.730.198/1820')
      expect(ie).to be_valid

      ie = described_class.new('123.456.782/2')
      expect(ie).to be_valid
    end
  end
end
