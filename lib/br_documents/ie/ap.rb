require_relative "base"

module BrDocuments
  module IE
    class AP < Base
      include Commons::Mod11

      private
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
        @number.gsub!(/\./, "")
        @number[-1].eql? generate_digital_check(@number, weight).to_s
      end

      def detect_range_digits
        number = @number[0, 8]
        if number.to_i >= 3000001 and number.to_i <= 3017000
          @p = 5
          @d = 0
        else
          if number.to_i >= 3017001 and number.to_i <= 3019022
            @p = 9
            @d = 1
          else
            @p = 0
            @d = 0
          end
        end
      end

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
