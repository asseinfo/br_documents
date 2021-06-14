require 'spec_helper'
require_relative 'shared_examples_for_pattern1'
require_relative 'shared_examples_for_to_remove_all_masks'

describe BrDocuments::IE::MA do
  describe '#formatted' do
    it 'returns a formatted ie' do
      ie = described_class.new('123456789')
      expect(ie.formatted).to eq '123456789'
    end
  end

  it_behaves_like 'a pattern1', 'MA'

  include_examples 'for to remove all masks', '12345678-9'
end