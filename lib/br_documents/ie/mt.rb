require_relative 'pattern1'

module BrDocuments
  module IE
    class MT < Pattern1
      def initialize(number)
        generate_zeros(number) { |zeros| number.insert(0, zeros) }

        super
        @mask = /^\d{4}\.?\d{3}\.?\d{3}\-?\d{1}$/
        @weight = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      end

      private

      def generate_zeros(number)
        just_numbers = number.gsub(/[\.\/-]/, '')
        zeros = ('0' * 11).slice(just_numbers.length, 11) if just_numbers.present?
        yield zeros.to_s if block_given?
      end

      def format_ie(number)
        number.sub(/(\d{10})(\d{1})/, '\\1-\\2')
      end
    end
  end
end
