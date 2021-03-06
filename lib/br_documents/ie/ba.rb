require_relative 'base'
require_relative '../commons/mod11'

module BrDocuments
  module IE
    class BA < Base
      include Commons::Mod11

      protected

      def format_ie(number)
        if number.delete('-').length == 8
          number.sub(/(\d{6})(\d{2})/, '\\1-\\2')
        else
          number.sub(/(\d{7})(\d{2})/, '\\1-\\2')
        end
      end

      def valid_format?
        valid_8_digits_format || valid_9_digits_format
      end

      def valid_check_digit?
        @number.gsub!(/[\.\/-]/, '')

        weight1 = make_weight(total_size)
        weight2 = make_weight(total_size - 1)

        digital_check2 = digital_check_generator(@number, weight2)
        number = "#{@number[0, body_size]}#{digital_check2}"
        digital_check1 = digital_check_generator(number, weight1)

        @number[-2, 2] == "#{digital_check1}#{digital_check2}"
      end

      private

      def valid_9_digits_format
        regex_mask1 = /^(\d{7}\-\d{2})$|^(\d{9})$/
        regex_mask2 = /^(\d{3}\.\d{3}\.\d{3})$|^(\d{9})$/
        regex_mask1.match(@number).present? || regex_mask2.match(@number).present?
      end

      def valid_8_digits_format
        regex = /^(\d{6}\-\d{2})$|^(\d{8})$/
        regex.match(@number).present?
      end

      def make_weight(size)
        weight = []
        size.downto(2) { |w| weight << w }

        weight
      end

      def total_size
        @number.gsub(/[\.\/-]/, '').length
      end

      def body_size
        digital_check_size = 2
        total_size - digital_check_size
      end

      def digital_check_generator(number, weight)
        if use_digital_check_mod10
          generate_check_digit_mod10(number, weight)
        else
          generate_check_digit(number, weight)
        end
      end

      def use_digital_check_mod10
        position = position_of_the_element_to_define_module
        @number[position].to_i <= 5 || @number[position].to_i == 8
      end

      def position_of_the_element_to_define_module
        if total_size == 8
          0
        else
          1
        end
      end

      def generate_check_digit_mod10(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum % 10
        mod.zero? ? 0 : (10 - mod)
      end
    end
  end
end
