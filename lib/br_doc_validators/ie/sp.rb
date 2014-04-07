require_relative "base"

module ValidaDocs
  module IE
    class SP < Base
      include Commons::Mod11

      private
      def format_ie(number)
        if number.gsub(/(\-)|(\.)|(\/)/, "").length == 13
          number.sub(/(\w{1})(\d{8})(\d{1})(\d{3})/, "\\1-\\2.\\3/\\4")
        else
          number.sub(/(\d{3})(\d{3})(\d{3})(\d{3})/, "\\1.\\2.\\3.\\4")
        end
      end

      def valid_format?
        regex = /^(\d{3}\.\d{3}\.\d{3}\.\d{3})$|^(\d{12})$|^(P-\d{8}\.\d{1}\/\d{3})$/
        regex.match(@number).present?
      end

      def valid_digital_check?
        if @number[0].eql? "P"
          valid_rural_producer_digital_check?
        else
          valid_standard_digital_check?
        end
      end

      def valid_standard_digital_check?
        @number.gsub!(/[\.\/P-]/, "")

        weight1 = [1, 3, 4, 5, 6, 7, 8, 10]
        weight2 = [3, 2, 10, 9, 8, 7, 6, 5, 4, 3, 2]

        dc1 = generate_digital_check(weight1)
        dc2 = generate_digital_check(weight2)

        (@number[8] == dc1) and (@number[11] == dc2)
      end

      def valid_rural_producer_digital_check?
        @number.gsub!(/[\.\/P-]/, "")
        weight9 = [1, 3, 4, 5, 6, 7, 8, 10]
        @number[8] == generate_digital_check(weight9)
      end

      def generate_digital_check(weights)
        sum = reduce_weights(@number, weights)
        mod = sum % 11
        mod.to_s[-1]
      end
    end
  end
end
