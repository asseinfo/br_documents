require 'spec_helper'

describe CnpjValidator do
  subject { described_class.new(attributes: 'cnpj') }

  let(:mock) { instance_double('model') }

  before do
    allow(mock).to receive(:errors).and_return([])
    allow(mock.errors).to receive(:messages).and_return({})
    allow(mock.errors).to receive(:add) do |attribute, error|
      mock.errors.messages[attribute] = [error]
    end
  end

  context 'when Cnpj is valid' do
    it "doesn't add errors in model" do
      subject.validate_each(mock, 'cnpj', '85961757000102')
      expect(mock.errors.messages).to be_empty
    end
  end

  context 'when Cnpj is blank' do
    it "doesn't add errors in model" do
      subject.validate_each(mock, 'cnpj', '')
      expect(mock.errors.messages).to be_empty
    end
  end

  context 'when Cnpj is invalid' do
    it 'adds errors in model' do
      subject.validate_each(mock, 'cnpj', '85961757000103')
      expect(mock.errors.messages).not_to be_empty
    end
  end
end
