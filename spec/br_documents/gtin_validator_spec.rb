require 'spec_helper'

describe GtinValidator do
  subject { described_class.new(attributes: 'gtin') }

  let(:record) { instance_double('model') }

  before do
    allow(record).to receive(:errors).and_return([])
    allow(record.errors).to receive(:messages).and_return({})
    allow(record.errors).to receive(:add) do |attribute, error|
      record.errors.messages[attribute] = [error]
    end
  end

  context 'when GTIN code is valid' do
    before { subject.validate_each(record, 'gtin', '1243658721548') }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context 'when GTIN is blank' do
    before { subject.validate_each(record, 'gtin', '') }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context 'when GTIN is nil' do
    before { subject.validate_each(record, 'gtin', nil) }

    it "doesn't add errors in model" do
      expect(record.errors.messages).to be_empty
    end
  end

  context 'when GTIN is invalid' do
    before { subject.validate_each(record, 'gtin', '253667853') }

    it 'adds errors in model' do
      expect(record.errors.messages).to include 'gtin' => [:invalid]
    end
  end
end
