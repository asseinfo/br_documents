require_relative "pattern1"

module BrDocuments
  module IE
    class MT < Pattern1
      def initialize(number)
        complete_with_zeros(number) { |completted| number = completted }

        super
        @mask = /^\d{4}\.?\d{3}\.?\d{3}\-?\d{1}$/
        @weight = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      end

      private
      def complete_with_zeros(number)
        just_numbers = number.gsub(/[\.\/-]/, "")
        zeros = ("0" * 11).slice(just_numbers.length, 11)
        yield "#{zeros}#{number}" if block_given?
      end

      def format_ie(number)
        number.sub(/(\d{10})(\d{1})/, "\\1-\\2")
      end
    end
  end
end
