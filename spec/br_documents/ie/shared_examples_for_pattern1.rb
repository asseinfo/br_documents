require 'spec_helper'

shared_examples 'a pattern1' do |uf|
  describe BrDocuments::IE::Factory, '#valid?' do
    it 'is invalid with malformed number' do
      ['1922212-21', '72.219.398-0', '63BA9943-8'].each do |number|
        ie = described_class.create(uf, number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with length different to 9' do
      ['1234567', '12345678901'].each do |number|
        ie = described_class.create(uf, number)
        expect(ie).not_to be_valid
      end
    end

    it 'is invalid with invalid check number' do
      ['226905727', '662637732'].each do |number|
        ie = described_class.create(uf, number)
        expect(ie).not_to be_valid
      end
    end

    it 'is valid with valid number' do
      ['732766940', '665822081'].each do |number|
        ie = described_class.create(uf, number)
        expect(ie).to be_valid
      end
    end
  end
end
