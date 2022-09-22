require 'spec_helper'

RSpec.describe IeValidator do
  subject { described_class.new(attributes: 'ie', uf: 'uf') }

  let(:record) { instance_double('model') }

  before do
    allow(record).to receive(:uf).and_return('SC')
    allow(record).to receive(:errors).and_return({})
    allow(record.errors).to receive(:messages).and_return({})
    allow(record.errors).to receive(:add) do |attribute, error|
      record.errors[attribute] ||= []
      record.errors[attribute] << error
      record.errors.messages[attribute] = record.errors[attribute]
    end
  end

  context "when IE's number is valid" do
    before { subject.validate_each(record, 'ie', '253667852') }

    it 'does not add errors in model' do
      expect(record.errors.messages).to be_empty
    end
  end

  context 'when IE is blank' do
    before { subject.validate_each(record, 'ie', '') }

    it 'does not add errors in model' do
      expect(record.errors.messages).to be_empty
    end
  end

  context 'when IE is invalid' do
    it 'adds :invalid error in the model' do
      subject.validate_each(record, 'ie', '253667853')

      expect(record.errors.messages['ie']).to include(:invalid)
    end

    it 'does not override the previous message' do
      record.errors.add('ie', 'another error message')
      subject.validate_each(record, 'ie', '253667853')

      expect(record.errors.messages['ie']).to include('another error message')
      expect(record.errors.messages['ie']).to include(:invalid)
    end
  end

  context 'when UF is invalid' do
    before do
      allow(record).to receive(:uf).and_return('XX')
      subject.validate_each(record, 'ie', '253667852')
    end

    it 'adds error in model' do
      expect(record.errors.messages['ie']).to include I18n.t('validator.ie.uf.invalid')
    end
  end

  context 'when cannot be found attribute uf in model' do
    before do
      allow(record).to receive(:uf).and_raise(NoMethodError)
      subject.validate_each(record, 'ie', '253667852')
    end

    it 'adds error in model' do
      expect(record.errors.messages[:base]).to eql [I18n.t('validator.ie.uf.no_present', uf: 'uf')]
    end
  end

  context 'when attribute uf is not defined' do
    subject { described_class.new(attributes: 'ie') }

    before { subject.validate_each(record, 'ie', '253667852') }

    it 'adds error in model' do
      expect(record.errors.messages[:base]).to eql [I18n.t('validator.ie.uf.no_configured')]
    end
  end
end
