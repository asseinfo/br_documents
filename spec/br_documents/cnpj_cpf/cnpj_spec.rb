require 'spec_helper'

describe BrDocuments::CnpjCpf::Cnpj do
  describe '#formatted' do
    it 'returns a formatted number' do
      cnpj = described_class.new('04001155000101')
      expect(cnpj.formatted).to eq '04.001.155/0001-01'
    end

    it 'returns a formatted alphanumeric number' do
      cnpj = described_class.new('12ABC34501DE35')
      expect(cnpj.formatted).to eq '12.ABC.345/01DE-35'
    end

    context 'when is invalid' do
      it 'returns an empty string' do
        cnpj = described_class.new('123')
        expect(cnpj.formatted).to eq ''
      end
    end
  end

  it 'is invalid with malformed number' do
    ['242.2818/50001-54', '35.611.011/000192'].each do |number|
      cnpj = described_class.new(number)
      expect(cnpj).not_to be_valid
    end
  end

  it 'is invalid with a number longer than 14' do
    ['24.228.185/0001-544', '936710360001881'].each do |number|
      cnpj = described_class.new(number)
      expect(cnpj).not_to be_valid
    end
  end

  it 'is invalid with a number shorter than 14' do
    ['24.228.185/0001-5', '9367103600018'].each do |number|
      cnpj = described_class.new(number)
      expect(cnpj).not_to be_valid
    end
  end

  it 'is invalid with a sequence of the same number' do
    ['11.111.111/1111-11', '22222222222222'].each do |number|
      cnpj = described_class.new(number)
      expect(cnpj).not_to be_valid
    end
  end

  it 'is invalid with invalid check number' do
    ['04.001.155/0001-03', '85961757000101'].each do |number|
      cnpj = described_class.new(number)
      expect(cnpj).not_to be_valid
    end
  end

  it 'is valid with correct number' do
    ['04.001.155/0001-01', '85961757000102'].each do |number|
      cnpj = described_class.new(number)
      expect(cnpj).to be_valid
    end
  end

  context 'when is alphanumeric CNPJ' do
    it 'is valid with correct alphanumeric number' do
      ['12ABC34501DE35', '12.ABC.345/01DE-35'].each do |number|
        cnpj = described_class.new(number)
        expect(cnpj).to be_valid
      end
    end

    it 'is valid when root is alphanumeric' do
      ['ABCDEFGH000195', 'AB.CDE.FGH/0001-95'].each do |number|
        cnpj = described_class.new(number)
        expect(cnpj).to be_valid
      end
    end

    it 'is valid when filial is alphanumeric' do
      ['12345678ABCD06', '12.345.678/ABCD-06'].each do |number|
        cnpj = described_class.new(number)
        expect(cnpj).to be_valid
      end
    end

    it 'is invalid with wrong check digit' do
      cnpj = described_class.new('12ABC34501DE99')
      expect(cnpj).not_to be_valid
    end

    it 'is invalid with lowercase input' do
      cnpj = described_class.new('12abc34501de35')
      expect(cnpj).not_to be_valid
    end

    it 'is invalid with special characters' do
      ['12AB!34501DE35', '12ABC345@1DE35'].each do |number|
        cnpj = described_class.new(number)
        expect(cnpj).not_to be_valid
      end
    end
  end
end
