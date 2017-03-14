require_relative "../commons/mod11"

module BrDocuments
  module CnpjCpf
    module Document
      include Commons::Mod11

      def initialize(number)
        @number = number
      end

      def valid?
        valid_format? && !sequence_of_equal_numbers? && valid_digital_check?
      end

      def formatted
        valid? ? format_number : ""
      end

      private

      def valid_format?
        format_regex.match(@number).present?
      end

      def sequence_of_equal_numbers?
        number_without_mask.split("").uniq.length == 1
      end

      def valid_digital_check?
        weight1, weight2 = weights_for_digital_check

        digital_check1 = generate_digital_check(number_without_mask, weight1)
        digital_check2 = generate_digital_check(number_without_mask, weight2)
        @number[-2, 2].eql? "#{digital_check1}#{digital_check2}"
      end

      def number_without_mask
        @number.gsub(/[\.\/-]/, "")
      end
    end
  end
end
