require "spec_helper"

describe BrDocuments::Gtin do
  describe "#valid?" do
    context 'when the checksum is valid' do
      context 'when the GTIN has 8 digits' do
        subject { described_class.new('12345618') }

        it { is_expected.to be_valid }
      end

      context 'when the GTIN has 12 digits' do
        subject { described_class.new('114567854874') }

        it { is_expected.to be_valid }
      end

      context 'when the GTIN has 13 digits' do
        subject { described_class.new('1145678548719') }

        it { is_expected.to be_valid }
      end

      context 'when the GTIN has 14 digits' do
        subject { described_class.new('1234567891125') }

        it { is_expected.to be_valid }
      end

      context 'when the number of digits is different of 8, 13 or 14' do
        subject { described_class.new('12345678901234560') }

        it { is_expected.to_not be_valid }
      end
    end

    context 'when the checksum is invald' do
      subject { described_class.new('1145678548712') }

      it { is_expected.to_not be_valid }
    end
  end
end
