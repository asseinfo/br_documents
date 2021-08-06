require 'spec_helper'

describe BrDocuments::Suframa do
  subject { described_class.new }

  describe '#formatted' do
    it 'returns the formatted number' do
      value = '100698107'

      subject = described_class.new(value)

      expect(subject.formatted).to eql '10.0698.107'
    end

    context 'when number is invalid' do
      it 'returns a empty string' do
        value = '123'

        subject = described_class.new(value)

        expect(subject.formatted).to eql ''
      end
    end

    it 'is invalid if number is malformed' do
      ['121.23.4123', '5.50.309.012', '5.503.090.12'].each do |number|
        suframa = described_class.new(number)

        expect(suframa).not_to be_valid
      end
    end

    it 'is invalid with a number longer than 9' do
      ['1234567890', '12.3456.7890'].each do |number|
        suframa = described_class.new(number)

        expect(suframa).not_to be_valid
      end
    end

    it 'is invalid with a number shorter than 9' do
      ['12345678', '12.3456.78'].each do |number|
        suframa = described_class.new(number)

        expect(suframa).not_to be_valid
      end
    end

    it 'is invalid with a sequence of the same number' do
      ['11.1111.111', '111111111'].each do |number|
        suframa = described_class.new(number)

        expect(suframa).not_to be_valid
      end
    end

    it 'is invalid with invalid verifying digit' do
      ['55.0309.010', '550309010'].each do |number|
        suframa = described_class.new(number)

        expect(suframa).not_to be_valid
      end
    end

    it 'is valid with correct number' do
      ['11.1279.100', '10.1040.105', '100628109', '100698107'].each do |number|
        suframa = described_class.new(number)

        expect(suframa).to be_valid
      end
    end
  end
end
