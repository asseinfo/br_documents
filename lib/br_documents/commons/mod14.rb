module BrDocuments
  module Commons
    module Mod14
      def generate_check_digit(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum % 11
        mod = (11 - mod)
        mod < 10 ? mod : (mod - 10)
      end

      def reduce_weights(values, weights)
        sum = 0
        weights.each_index do |i|
          sum += weights[i] * values[i].to_i
        end
        sum
      end
    end
  end
end
