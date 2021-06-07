require_relative 'base'
require_relative '../commons/mod11'

module BrDocuments
  module IE
    class AP < Base
      include Commons::Mod11

      protected

      def format_ie(number)
        number
      end

      def valid_format?
        regex = /(\d{9})$/
        regex.match(@number).present?
      end

      def valid_digital_check?
        weight = [9, 8, 7, 6, 5, 4, 3, 2]
        detect_range_digits
        @number[-1] == generate_digital_check(@number, weight).to_s
      end

      private

      # rubocop:disable Metrics/MethodLength
      def detect_range_digits
        number = @number[0, 8].to_i

        if number >= 3_000_001 && number <= 3_017_000
          @p = 5
          @d = 0
        elsif number >= 3_017_001 && number <= 3_019_022
          @p = 9
          @d = 1
        elsif number >= 3_019_023
          @p = 0
          @d = 0
        end
      end
      # rubocop:enable Metrics/MethodLength

      def generate_digital_check(values, weights)
        sum = reduce_weights(values, weights)
        sum += @p
        mod = sum % 11
        digital_check = 11 - mod
        digital_check = 0 if digital_check == 10
        digital_check = @d if digital_check == 11
        digital_check
      end
    end
  end
end
