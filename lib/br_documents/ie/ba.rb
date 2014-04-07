require_relative "base"

module BrDocuments
  module IE
    class BA < Base
      include Commons::Mod11

      private
      def format_ie(number)
        if number.gsub(/-/, "").length == 8
          number.sub(/(\d{6})(\d{2})/, "\\1-\\2")
        else
          number.sub(/(\d{7})(\d{2})/, "\\1-\\2")
        end
      end

      def valid_format?
        valid_8_digits_format or valid_9_digits_format
      end

      def valid_9_digits_format
        regex = /^(\d{6}\-\d{2})$|^(\d{8})$/
        regex.match(@number).present?
      end

      def valid_8_digits_format
        regex = /^(\d{7}\-\d{2})$|^(\d{9})$/
        regex.match(@number).present?
      end

      def valid_digital_check?
        @number.gsub!(/-/, "")

        weight1 = make_weight(total_size)
        weight2 = make_weight(total_size-1)

        digital_check2 = digital_check_generator(@number, weight2)
        number = "#{@number[0, body_size]}#{digital_check2}"
        digital_check1 = digital_check_generator(number, weight1)

        @number[-2, 2].eql? "#{digital_check1}#{digital_check2}"
      end

      def make_weight(size)
        weight = []
        size.downto(2) { |w| weight << w }

        weight
      end

      def total_size
        @number.gsub(/-/, "").length
      end

      def body_size
        digital_check_size = 2
        total_size - digital_check_size
      end

      def digital_check_generator(number, weight)
        if @number[0].to_i <= 5 or @number[0].to_i == 8
          generate_digital_check_mod10(number, weight)
        else
          generate_digital_check(number, weight)
        end
      end

      def generate_digital_check_mod10(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum % 10
        mod == 0 ? 0 : (10 - mod)
      end
    end
  end
end
