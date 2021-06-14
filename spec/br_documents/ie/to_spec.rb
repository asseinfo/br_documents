require 'spec_helper'
require_relative 'shared_examples_for_to_remove_all_masks'

describe BrDocuments::IE::TO do
  describe '#formatted' do
    context 'when having 9 digits' do
      subject { described_class.new('123456789') }

      it 'returns a formatted ie' do
        expect(subject.formatted).to eq '12.345678-9'
      end
    end

    context 'when having 11 digits' do
      subject { described_class.new('12345678901') }

      it 'returns a formatted ie' do
        expect(subject.formatted).to eq '12.34.567890-1'
      end
    end
  end

  describe '#valid?' do
    it 'is invalid with malformed number' do
      ['2.903.593.362-3', '29.02.79268-45', '29.02.5AB420-5'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with length different of 9 or 11' do
      ['12345678', '1234567890', '123456789012'].each do |number|
        ie = described_class.new(number)
        expect(ie).not_to be_valid
      end
    end

    context 'when having 9 digits' do
      it 'is invalid with invalid check number' do
        ['290227835', '294083153'].each do |number|
          ie = described_class.new(number)
          expect(ie).not_to be_valid
        end
      end

      it 'is invalid with correct check number but invalid mask' do
        ['29-022783-6', '29.408315.4'].each do |number|
          ie = described_class.new(number)
          expect(ie).not_to be_valid
        end
      end

      it 'is valid with valid number' do
        ['290227836', '294083154'].each do |number|
          ie = described_class.new(number)
          expect(ie).to be_valid
        end
      end

      it 'is valid with valid masked number' do
        ['29.022783-6', '29.408315-4'].each do |number|
          ie = described_class.new(number)
          expect(ie).to be_valid
        end
      end
    end

    context 'when having 11 digits' do
      it 'is invalid with invalid check number' do
        ['29023864406', '29023864409'].each do |number|
          ie = described_class.new(number)
          expect(ie).not_to be_valid
        end
      end

      it 'is invalid with correct check number but invalid mask' do
        ['29-99.200143-6', '29.99.231741.7'].each do |number|
          ie = described_class.new(number)
          expect(ie).not_to be_valid
        end
      end

      it 'is valid with valid number' do
        ['29992001436', '29992317417'].each do |number|
          ie = described_class.new(number)
          expect(ie).to be_valid
        end
      end

      it 'is valid with valid masked number' do
        ['29.99.200143-6', '29.99.231741-7'].each do |number|
          ie = described_class.new(number)
          expect(ie).to be_valid
        end
      end
    end

    include_examples 'for to remove all masks', '29.99.231741-7'
  end
end
