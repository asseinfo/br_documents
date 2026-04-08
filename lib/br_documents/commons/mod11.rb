module BrDocuments
  module Commons
    module Mod11
      def generate_check_digit(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum % 11
        mod < 2 ? 0 : (11 - mod)
      end

      # Using `char.ord - 48` instead of `char.to_i` to support the new alphanumeric
      # CNPJ format introduced by Receita Federal, where the root and filial segments
      # may contain uppercase letters (A-Z) in addition to digits (0-9).
      # `char.ord - 48` maps digits to their face value (e.g. '9' => 9) and letters
      # to their offset value (e.g. 'A' => 17, 'B' => 18, ..., 'Z' => 42),
      # which is the algorithm defined by the new CNPJ specification.
      # This is backwards-compatible with CPF since for digit characters
      # `char.ord - 48` produces the same result as `char.to_i`.
      def reduce_weights(values, weights)
        sum = 0
        weights.each_index do |i|
          sum += weights[i] * (values[i].ord - 48)
        end
        sum
      end
    end
  end
end
