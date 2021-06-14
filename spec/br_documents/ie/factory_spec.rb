require 'spec_helper'

describe BrDocuments::IE::Factory do
  describe '.create' do
    context 'when uf is AC' do
      it 'returns an instance of BrDocuments::IE::AC' do
        ie = described_class.create('AC', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::AC
      end
    end

    context 'when uf is AL' do
      it 'returns an instance of BrDocuments::IE::AL' do
        ie = described_class.create('AL', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::AL
      end
    end

    context 'when uf is AP' do
      it 'returns an instance of BrDocuments::IE::AP' do
        ie = described_class.create('AP', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::AP
      end
    end

    context 'when uf is AM' do
      it 'returns an instance of BrDocuments::IE::AM' do
        ie = described_class.create('AM', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::AM
      end
    end

    context 'when uf is BA' do
      it 'returns an instance of BrDocuments::IE::BA' do
        ie = described_class.create('BA', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::BA
      end
    end

    context 'when uf is CE' do
      it 'returns an instance of BrDocuments::IE::CE' do
        ie = described_class.create('CE', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::CE
      end
    end

    context 'when uf is DF' do
      it 'returns an instance of BrDocuments::IE::DF' do
        ie = described_class.create('DF', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::DF
      end
    end

    context 'when uf is ES' do
      it 'returns an instance of BrDocuments::IE::ES' do
        ie = described_class.create('ES', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::ES
      end
    end

    context 'when uf is GO' do
      it 'returns an instance of BrDocuments::IE::GO' do
        ie = described_class.create('GO', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::GO
      end
    end

    context 'when uf is MA' do
      it 'returns an instance of BrDocuments::IE::MA' do
        ie = described_class.create('MA', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::MA
      end
    end

    context 'when uf is MG' do
      it 'returns an instance of BrDocuments::IE::MG' do
        ie = described_class.create('MG', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::MG
      end
    end

    context 'when uf is MS' do
      it 'returns an instance of BrDocuments::IE::MS' do
        ie = described_class.create('MS', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::MS
      end
    end

    context 'when uf is MT' do
      it 'returns an instance of BrDocuments::IE::MT' do
        ie = described_class.create('MT', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::MT
      end
    end

    context 'when uf is PA' do
      it 'returns an instance of BrDocuments::IE::PA' do
        ie = described_class.create('PA', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::PA
      end
    end

    context 'when uf is PB' do
      it 'returns an instance of BrDocuments::IE::PB' do
        ie = described_class.create('PB', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::PB
      end
    end

    context 'when uf is PR' do
      it 'returns an instance of BrDocuments::IE::PR' do
        ie = described_class.create('PR', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::PR
      end
    end

    context 'when uf is PE' do
      it 'returns an instance of BrDocuments::IE::PE' do
        ie = described_class.create('PE', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::PE
      end
    end

    context 'when uf is PI' do
      it 'returns an instance of BrDocuments::IE::PI' do
        ie = described_class.create('PI', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::PI
      end
    end

    context 'when uf is RJ' do
      it 'returns an instance of BrDocuments::IE::RJ' do
        ie = described_class.create('RJ', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::RJ
      end
    end

    context 'when uf is returns' do
      it 'returns an instance of BrDocuments::IE::RN' do
        ie = described_class.create('RN', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::RN
      end
    end

    context 'when uf is RS' do
      it 'returns an instance of BrDocuments::IE::RS' do
        ie = described_class.create('RS', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::RS
      end
    end

    context 'when uf is RO' do
      it 'returns an instance of BrDocuments::IE::RO' do
        ie = described_class.create('RO', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::RO
      end
    end

    context 'when uf is RR' do
      it 'returns an instance of BrDocuments::IE::RR' do
        ie = described_class.create('RR', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::RR
      end
    end

    context 'when uf is SC' do
      it 'returns an instance of BrDocuments::IE::SC' do
        ie = described_class.create('SC', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::SC
      end
    end

    context 'when uf is SP' do
      it 'returns an instance of BrDocuments::IE::SP' do
        ie = described_class.create('SP', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::SP
      end
    end

    context 'when uf is SE' do
      it 'returns an instance of BrDocuments::IE::SE' do
        ie = described_class.create('SE', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::SE
      end
    end

    context 'when uf is TO' do
      it 'returns an instance of BrDocuments::IE::TO' do
        ie = described_class.create('TO', '123456789')
        expect(ie).to be_an_instance_of BrDocuments::IE::TO
      end
    end

    context 'when uf is invalid' do
      it 'is returns an error' do
        expect do
          described_class.create('', '')
        end.to raise_error(ArgumentError, t('validator.ie.uf.invalid'))
      end
    end
  end
end
