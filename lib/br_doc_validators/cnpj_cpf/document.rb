require_relative "../commons/mod11"

module ValidaDocs
  module CnpjCpf
    module Document
      include Commons::Mod11

      protected
      def valid_number?(number, regex, weight1, weight2)
        valid_format?(number, regex) and
         not sequence_of_equal_numbers?(number) and
         valid_digital_check?(number, weight1, weight2)
      end

      private
      def valid_format?(number, regex)
        regex.match(number).present?
      end

      def sequence_of_equal_numbers?(number)
        remove_mask(number).split("").uniq.length == 1
      end

      def valid_digital_check?(number, weight1, weight2)
        digital_check1 = generate_digital_check(remove_mask(number), weight1)
        digital_check2 = generate_digital_check(remove_mask(number), weight2)
        number[-2, 2].eql? "#{digital_check1}#{digital_check2}"
      end

      def remove_mask(number)
        number.gsub(/[\.\/-]/, "")
      end
    end
  end
end
